@extends('user.layouts.master')

@section('content')
<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Start Booking section  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
<div class="body-wrapper">
    <div class="row mb-30-none justify-content-center">
        <div class="col-lg-6 col-md-6 col-sm-12 mb-30">
            <div class="booking-area">
                <h4 class="title"><i class="fas fa-user text--base me-2"></i>{{__("Doctor Information")}}</h4>
                <div class="thumb">
                    <img src="{{ get_image($booking->doctors->image ?? '' , 'site-section') ?? '' }}" alt="profile">
                </div>
                <div class="content">
                    <div class="list-wrapper">
                        <ul class="list">
                            <li>{{__("Name")}}<span>{{ $booking->doctors->name ?? "" }}</span></li>
                            <li>{{__("Qualifications")}}<span>{{ $booking->doctors->qualification ?? "" }}</span></li>
                            <li>{{__("Speciality")}}<span>{{ $booking->doctors->speciality ?? "" }}</span></li>
                            <li>{{__("Contact")}}<span>{{ $booking->doctors->contact ?? "" }}</span></li>
                            <li>{{__("Floor Number")}}<span>{{ $booking->doctors->floor_number ?? "" }}</span></li>
                            <li>{{__("Room Number")}}<span>{{ $booking->doctors->room_number ?? "" }}</span></li>
                            <li>{{__("Fees")}}<span>{{ get_amount($booking->doctors->fees ?? "") }}</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 mb-30">
            <div class="booking-area">
                <h4 class="title"><i class="fas fa-calendar-check text--base me-2"></i>{{__("Schedule Information")}}</h4>
                <div class="content pt-0">
                    <div class="list-wrapper">
                        <ul class="list">
                            @php
                            
                                $from_time        = $booking->schedules->from_time ?? '';
                                $parsed_from_time = \Carbon\Carbon::createFromFormat('H:i', $from_time)->format('h A');

                                $to_time          = $booking->schedules->to_time ?? '';
                                $parsed_to_time   = \Carbon\Carbon::createFromFormat('H:i', $to_time)->format('h A');

                            @endphp
                            <li>{{__("Day")}}<span>{{ $booking->schedules->week->day ?? "" }}</span></li>
                            <li>{{__("From Time")}}<span>{{ $parsed_from_time ?? '' }}</span></li>
                            <li>{{__("To Time")}}<span>{{ $parsed_to_time ?? '' }}</span></li>
                            @if (isset($booking->prescription))
                                <li>{{__("Prescription")}}<span><a class="btn btn--base" href="{{ setRoute('user.history.prescription.download',$booking->slug) }}">{{ __("Download") }}</a></span></li>
                            @endif
                        </ul>
                    </div>
                    <div class="list-wrapper pt-20">
                        <h4 class="title"><i class="fas fa-clipboard-list text--base me-2"></i>{{__("Serial")}}</h4>
                        <ul class="list">
                            <li>{{__("Serial Number")}}<span>{{ $booking->patient_number ?? ""}}</span></li>
                            
                        </ul>
                    </div>
                    @if (isset($booking->details->payment_method))
                        <div class="list-wrapper pt-20">
                            <h4 class="title"><i class="fas fa-credit-card text--base me-2"></i>{{__("Payment Method Information")}}</h4>
                            <ul class="list">
                                
                                @if ($booking->details->payment_method == global_const()::CASH_PAYMENT)
                                    <li>{{__("Payment Method")}}<span>{{ $booking->details->payment_method ?? ""}}</span></li>
                                    <li>{{__("Doctor Fees")}}<span>{{ get_amount($booking->details->doctor_fees) ?? ""}} {{ $booking->details->currency ?? '' }}</span></li>
                                    <li>{{__("Fees & Charges")}}<span>{{ $booking->details->total_charge ?? ""}} {{ $booking->details->currency ?? '' }}</span></li>
                                    <li>{{__("Payable Amount")}}<span>{{ $booking->details->payable_amount ?? ""}} {{ $booking->details->currency ?? '' }}</span></li>
                                @else
                                    <li>{{__("Payment Method")}}<span>{{ $booking->details->payment_method ?? ""}}</span></li>
                                    <li>{{__("Doctor Fees")}}<span>{{ get_amount($booking->details->doctor_fees) ?? ""}} {{ $booking->details->currency ?? '' }}</span></li>
                                    <li>{{__("Fees & Charges")}}<span>{{ $booking->details->total_charge ?? ""}} {{ $booking->details->currency ?? '' }}</span></li>
                                    <li>{{__("Exchange Rate")}}<span>1 {{ $booking->details->currency ?? '' }} = {{ get_amount($booking->details->gateway_currency->rate) ?? "" }} {{ $booking->details->gateway_currency->code ?? "" }}</span></li>
                                    <li>{{__("Payable Amount")}}<span>{{ get_amount(floatval($booking->details->gateway_payable)) }} {{ $booking->details->gateway_currency->code ?? "" }}</span></li>
                                @endif 
                                    
                            </ul>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    End Booking section  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

@endsection