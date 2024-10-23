<?php

namespace App\Models\Admin;

use App\Traits\PaymentGateway\Tatum;
use App\Constants\PaymentGatewayConst;
use App\Traits\PaymentGateway\Razorpay;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PaymentGateway extends Model
{
    use HasFactory,Tatum,Razorpay;

    protected $guarded = ['id'];

    protected $casts = [
        'id'                   => 'integer',
        'slug'                 => 'string',
        'code'                 => 'integer',
        'type'                 => 'string',
        'name'                 => 'string',
        'title'                => 'string',
        'alias'                => 'string',
        'image'                => 'string',
        'credentials'          => 'object',
        'supported_currencies' => 'object',
        'crypto'               => 'boolean',
        'desc'                 => 'string',
        'input_fields'         => 'object',
        'env'                  => 'string',
        'status'               => 'integer',
        'last_edit_by'         => 'integer',
        'created_at'           => 'date:Y-m-d',
        'updated_at'           => 'date:Y-m-d',
    ];

    protected $with = [
        'currencies',
    ];

    public function scopeAutomatic($query)
    {
        return $query->where(function ($q) {
            $q->where("type", PaymentGatewayConst::AUTOMATIC);
        });
    }
    public function scopeGateway($query, $keyword)
    {
        if (is_numeric($keyword)) return $query->where('code', $keyword);
        return $query->where('alias', $keyword);
    }


    public function currencies()
    {
        return $this->hasMany(PaymentGatewayCurrency::class, 'payment_gateway_id')->orderBy("id", "DESC");
    }

    public function scopePaymentMethod($query)
    {
        return $query->where(function ($q) {
            $q->where('slug', PaymentGatewayConst::payment_method_slug());
        });
    }
    
    public function scopeAddMoney($query)
    {
        return $query->where(function ($q) {
            $q->where('slug', PaymentGatewayConst::add_money_slug());
        });
    }

    public function scopeMoneyOut($query)
    {
        return $query->where(function ($q) {
            $q->where('slug', PaymentGatewayConst::money_out_slug());
        });
    }

    public function scopeManual($query)
    {
        return $query->where(function ($q) {
            $q->where("type", PaymentGatewayConst::MANUAL);
        });
    }
    public function scopeActive($query)
    {
        return $query->where(function ($q) {
            $q->where("status", PaymentGatewayConst::ACTIVE);
        });
    }
    public function isCrypto() {
        if($this->crypto == true) return true;
        return false;
    }

    public function cryptoAssets() 
    {
        return $this->hasMany(CryptoAsset::class,'payment_gateway_id');
    }

    public function isAutomatic() {
        if($this->type == PaymentGatewayConst::AUTOMATIC) {
            return true;
        }
        return false;
    }
    
}
