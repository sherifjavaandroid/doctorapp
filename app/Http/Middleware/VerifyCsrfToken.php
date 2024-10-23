<?php

namespace App\Http\Middleware;

use App\Constants\PaymentGatewayConst;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        'user/username/check',
        'user/check/email',
        'success/response/' . PaymentGatewayConst::SSLCOMMERZ,
        'cancel/response/' . PaymentGatewayConst::SSLCOMMERZ,
        'success/response/' . PaymentGatewayConst::RAZORPAY,
        'cancel/response/' . PaymentGatewayConst::RAZORPAY,
    ];
}
