<?php
namespace App\Traits\PaymentGateway;

use Exception;
use Illuminate\Support\Str;
use App\Models\TemporaryData;
use App\Models\DoctorAppointment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use App\Constants\PaymentGatewayConst;

trait CoinGate {
    
    private $coinGate_gateway_credentials;
    private $coinGate_access_token;

    private $coinGate_status_paid = "paid";
    
    public function coinGateInit($output = null) {
        
        if(!$output) $output = $this->output;
        $credentials = $this->getCoinGateCredentials($output);
        $request_credentials = $this->getCoinGateRequestCredentials();
        
        return $this->coinGateCreateOrder($request_credentials);
        
    }

    public function getCoinGateCredentials($output) {
        $gateway = $output['gateway'] ?? null;
        if(!$gateway) throw new Exception("Payment gateway not available");

        $production_url_sample = ['live','live url','live env','live environment', 'coin gate live url','coin gate live','production url', 'production link'];
        $production_app_token_sample = ['production token','production app token','production auth token','live token','live app token','live auth token'];
        $sandbox_url_sample = ['sandbox','sandbox url','sandbox env', 'test url', 'test', 'sandbox environment', 'coin gate sandbox url', 'coin gate sandbox' , 'coin gate test'];
        $sandbox_app_token_sample = ['sandbox token','sandbox app token','test app token','test token','test auth token','sandbox auth token'];

        $production_url = $this->getValueFromGatewayCredentials($gateway,$production_url_sample);
        $production_app_token = $this->getValueFromGatewayCredentials($gateway,$production_app_token_sample);
        $sandbox_url = $this->getValueFromGatewayCredentials($gateway,$sandbox_url_sample);
        $sandbox_app_token = $this->getValueFromGatewayCredentials($gateway,$sandbox_app_token_sample);
        
        $mode = $gateway->env;
        
        $gateway_register_mode = [
            PaymentGatewayConst::ENV_SANDBOX => "sandbox",
            PaymentGatewayConst::ENV_PRODUCTION => "production",
        ];

        if(array_key_exists($mode,$gateway_register_mode)) {
            $mode = $gateway_register_mode[$mode];
        }else {
            $mode = "sandbox";
        }

        $credentials = (object) [
            'production_url'    => $production_url,
            'production_token'  => $production_app_token,
            'sandbox_url'       => $sandbox_url,
            'sandbox_token'     => $sandbox_app_token,
            'mode'              => $mode,
        ];

        $this->coinGate_gateway_credentials = $credentials;

        return $credentials;
    }

    public function getCoinGateRequestCredentials($output = null) {
        $credentials = $this->coinGate_gateway_credentials;
        if(!$output) $output = $this->output;

        $request_credentials = [];
        if($output['gateway']->env == PaymentGatewayConst::ENV_PRODUCTION) {
            $request_credentials['url']     = $credentials->production_url;
            $request_credentials['token']   = $credentials->production_token;
        }else {
            $request_credentials['url']     = $credentials->sandbox_url;
            $request_credentials['token']   = $credentials->sandbox_token;
        }
        return (object) $request_credentials;
    }

    public function registerCoinGateEndpoints() {
        return [
            'createOrder'       => 'orders',
        ];
    }

    public function getCoinGateEndpoint($name) {
        $endpoints = $this->registerCoinGateEndpoints();
        if(array_key_exists($name,$endpoints)) {
            return $endpoints[$name];
        }
        throw new Exception("Oops! Request endpoint not registered!");
    }

    public function coinGateCreateOrder($credentials) {
        $request_base_url       = $credentials->url;
        $request_access_token   = $credentials->token;

        $temp_record_token = generate_unique_string('doctor_appointments','slug',60);
        $this->setUrlParams("token=" . $temp_record_token); // set Parameter to URL for identifying when return success/cancel
        
        $redirection = $this->getRedirection();
        
        $url_parameter = $this->getUrlParams();
        
        $endpoint = $request_base_url . "/" . $this->getCoinGateEndpoint('createOrder');
        
        $response = Http::withToken($request_access_token)->post($endpoint,[
            'order_id'          => Str::uuid(),
            'price_amount'      => $this->output['amount']->total_amount,
            'price_currency'    => $this->output['amount']->sender_cur_code,
            'receive_currency'  => $this->output['amount']->default_currency,
            'callback_url'      => $this->setGatewayRoute($redirection['callback_url'],PaymentGatewayConst::COIN_GATE,$url_parameter),
            'cancel_url'        => $this->setGatewayRoute($redirection['cancel_url'],PaymentGatewayConst::COIN_GATE,$url_parameter),
            'success_url'       => $this->setGatewayRoute($redirection['return_url'],PaymentGatewayConst::COIN_GATE,$url_parameter),
        ]);
        
        if($response->failed()) {
            $message = json_decode($response->body(),true);
            throw new Exception($message['message']);
        }
        
        $error_message  = "Something went wrong! Please try again.";



        if($response->successful()) {
            $response_array = json_decode($response->body(),true);
            if(isset($response_array['payment_url'])) {
                // create junk transaction
                $output         = $this->output;
                $booking_data   = DoctorAppointment::where('slug',$output['form_data']['identifier'])->first();
                if($booking_data->authenticated == true){
                    $this->coinGateJunkInsert($this->output,$response_array,$temp_record_token);
                }else{
                    $this->coinGateJunkInsertForUnAuth($this->output,$response_array,$temp_record_token);
                }
                if(request()->expectsJson()) {
                    $this->output['redirection_response']   = $response_array;
                    $this->output['redirect_links']         = [];
                    $this->output['redirect_url']           = $response_array['payment_url'];
                    return $this->get();
                }
                return redirect()->away($response_array['payment_url']);
            }
        }
        $error_message = $response->json()['message' ];
        
        throw new Exception($error_message);

    }

    public function coinGaTeJunkInsert($output,$response, $temp_identifier) {

        $data = [
            'gateway'       => $output['gateway']->id,
            'currency'      => [
                'id'        => $output['currency']->id,
                'alias'     => $output['currency']->alias
            ],
            'amount'        => json_decode(json_encode($output['amount']),true),
            'response'      => $response,
            'creator_table' => auth()->guard(get_auth_guard())->user()->getTable() ?? '',
            'creator_id'    => auth()->guard(get_auth_guard())->user()->id ?? '',
            'creator_guard' => get_auth_guard() ?? '',
            'user_record'   => $output['form_data']['identifier'],
        ];
        
        return TemporaryData::create([
            'type'          => PaymentGatewayConst::COIN_GATE,
            'identifier'    => $temp_identifier,
            'data'          => $data,
        ]);
    }
    public function coinGaTeJunkInsertForUnAuth($output,$response, $temp_identifier) {

        $data = [
            'gateway'       => $output['gateway']->id,
            'currency'      => [
                'id'        => $output['currency']->id,
                'alias'     => $output['currency']->alias
            ],
            'amount'        => json_decode(json_encode($output['amount']),true),
            'response'      => $response,
            'user_record'   => $output['form_data']['identifier'],
        ];
        
        return TemporaryData::create([
            'type'          => PaymentGatewayConst::COIN_GATE,
            'identifier'    => $temp_identifier,
            'data'          => $data,
        ]);
    }

    public function coingateSuccess($output = null) {
        $reference              = $output['tempData']['identifier'];

        $output['capture']      = $output['tempData']['data']->response ?? "";
        $output['callback_ref'] = $reference;

        // Search data on transaction table
        if(!$this->searchWithReferenceInTransaction($reference)) {

            // need to insert new transaction in database
            try{
                $transaction_response = $this->createTransaction($output, global_const()::APPROVED);
            }catch(Exception $e) {
                throw new Exception($e->getMessage());
            }
        }
        return $transaction_response;
    }

    public static function isCoinGate($gateway) {
        $search_keyword = ['coingate','coinGate','coingate gateway','coingate crypto gateway','crypto gateway coingate'];
        $gateway_name = $gateway->name;

        $search_text = Str::lower($gateway_name);
        $search_text = preg_replace("/[^A-Za-z0-9]/","",$search_text);
        foreach($search_keyword as $keyword) {
            $keyword = Str::lower($keyword);
            $keyword = preg_replace("/[^A-Za-z0-9]/","",$keyword);
            if($keyword == $search_text) {
                return true;
                break;
            }
        }
        return false;
    }

    public function coingateCallbackResponse($reference,$callback_data, $output = null) {

        if(!$output) $output = $this->output;

        $callback_status = $callback_data['status'] ?? "";

        if(isset($output['transaction']) && $output['transaction'] != null && $output['transaction']->status != global_const()::APPROVED) { // if transaction already created & status is not success

            // Just update transaction status and update user wallet if needed
            if($callback_status == $this->coinGate_status_paid) {

                $transaction_details                        = json_decode(json_encode($output['transaction']->details),true) ?? [];
                $transaction_details['gateway_response']    = $callback_data;

                // update transaction status
                DB::beginTransaction();

                try{
                    DB::table($output['transaction']->getTable())->where('id',$output['transaction']->id)->update([
                        'status'        => global_const()::APPROVED,
                        'details'       => json_encode($transaction_details),
                        'callback_ref'  => $reference,
                    ]);

                   
                    DB::commit();
                    
                }catch(Exception $e) {
                    DB::rollBack();
                    logger($e->getMessage());
                    throw new Exception($e);
                }
            }
        }else { // need to create transaction and update status if needed

            $status = global_const()::APPROVED;

            if($callback_status == $this->coinGate_status_paid) {
                $status = global_const()::APPROVED;
            }

            $this->createTransaction($output, $status);
        }

        logger("Transaction Created Successfully ::" . $callback_data['status']);
    }
}
