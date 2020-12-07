@extends('Master.main')
@section('title')
    Dashboard
@endsection
@section('content')

<div class="product-sales-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                <div class="product-sales-chart">
                    <div class="portlet-title">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="caption pro-sl-hd">
                                    <span class="caption-subject text-uppercase"><b>Product Sales</b></span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="actions graph-rp">
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-grey active">
                                            <input type="radio" name="options" class="toggle" id="option1" checked="">Today</label>
                                        <label class="btn btn-grey">
                                            <input type="radio" name="options" class="toggle" id="option2">Week</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="morris-area-chart" style="height:350px;"></div>
                </div>

                @can('superAdmin')
                <div class="row" style="margin-top: 17px;">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="white-box analytics-info-cs mg-b-10">
                            <h3 class="box-title" style="font-size:15px;">Monthly Shop Registration</h3>
                            <ul class="list-inline" style="font-size:20px;">
                                <li class="">
                                    <span class="counter text-primary" style="font-weight:bold;">0</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="white-box analytics-info-cs mg-b-10">
                            <h3 class="box-title" style="font-size:15px;">Total Registrated Shop</h3>
                            <ul class="list-inline" style="font-size:20px;">
                                <li class="">
                                    <span class="counter text-info" style="font-weight:bold;">0</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="white-box analytics-info-cs mg-b-10">
                            <h3 class="box-title" style="font-size:15px;">Total Active Shop</h3>
                            <ul class="list-inline" style="font-size:20px;">
                                <li class="">
                                    <span class="counter text-success" style="font-weight:bold;">0</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endcan
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                @can('admin')
                <div class="white-box analytics-info-cs mg-b-10 res-mg-t-30">
                    <h3 class="box-title">Today Purchase</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-success" style="font-weight:bold;">{{ $tPur }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Today Sales</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-info" style="font-weight:bold;">{{ $tSal }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Today Expense</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-warning" style="font-weight:bold;">{{ $tExp }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs">
                    <h3 class="box-title">Gross Profit</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-danger" style="font-weight:bold;">{{ $gross }}</span>
                        </li>
                    </ul>
                </div>
                @endcan
                @can('manager')
                <div class="white-box analytics-info-cs mg-b-10 res-mg-t-30">
                    <h3 class="box-title">Today Purchase</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-success" style="font-weight:bold;">{{ $tPur }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Today Sales</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-info" style="font-weight:bold;">{{ $tSal }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Today Expense</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-warning" style="font-weight:bold;">{{ $tExp }}</span>
                        </li>
                    </ul>
                </div>
                @endcan
                @can('superAdmin')
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title" style="font-size:15px;">Monthly Shop Registration</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-primary" style="font-weight:bold;">{{ $tMsr }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title" style="font-size:15px;">Total Registrated Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-info" style="font-weight:bold;">{{ $tRs }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title" style="font-size:15px;">Total Active Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-success" style="font-weight:bold;">{{ $tAs }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title" style="font-size:15px;">Total Inactive Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-danger" style="font-weight:bold;">{{ $tIs }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs">
                    <h3 class="box-title" style="font-size:15px;">Total Demo Package Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-warning" style="font-weight:bold;">{{ $tDps }}</span>
                        </li>
                    </ul>
                </div>
                @endcan
                @can('reference')
                <div class="white-box analytics-info-cs mg-b-10 res-mg-t-30">
                    <h3 class="box-title">Total Registrated Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-success" style="font-weight:bold;">{{ $Rtrs }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Total Active Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-info" style="font-weight:bold;">{{ $Rtas }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs mg-b-10">
                    <h3 class="box-title">Total Inactive Shop</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">
                            <span class="counter text-warning" style="font-weight:bold;">{{ $Rtis }}</span>
                        </li>
                    </ul>
                </div>
                <div class="white-box analytics-info-cs">
                    <h3 class="box-title">Total Payment</h3>
                    <ul class="list-inline" style="font-size:20px;">
                        <li class="">Tk.
                            <span class="counter text-danger" style="font-weight:bold;">{{ $Rtp }}</span>
                        </li>
                    </ul>
                </div>
                @endcan
            </div>
        </div>
    </div>
</div>

{{-- <div class="calender-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="calender-inner">
                    <div id='calendar'></div>
                </div>
            </div>
        </div>
    </div>
</div> --}}

@endsection