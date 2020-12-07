@extends('Master.main')
@section('title')
Batch Wise Stock
@endsection
@section('content')

    <!-- <style type="text/css">
        .orng{
            color: orange;
        }
        .bkorng{
            background-color: orange;
        }
    </style> -->

<div class="data-table-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="sparkline13-list">
                    <div class="sparkline13-hd">
                        <div class="main-sparkline13-hd">
                            <div style="float:right;">
                                <!-- *<small class="bkorng">Quantity Less Than Minimum Stock</small>  -->
                            </div>
                            <h1>Batch Wise Stock</h1>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="sparkline13-graph">
                        <div class="datatable-dashv1-list custom-datatable-overright">
                            <div id="toolbar">
                                <select class="form-control">
                                    <option value="">Export Basic</option>
                                    <option value="all">Export All</option>
                                    <option value="selected">Export Selected</option>
                                </select>
                            </div>
                            <table id="table" data-toggle="table" data-pagination="true" 
                                    data-search="true" data-show-columns="true" 
                                    data-show-pagination-switch="true" data-show-refresh="true" 
                                    data-key-events="true" data-show-toggle="true" 
                                    data-resizable="true" data-cookie="true"
                                    data-cookie-id-table="saveId" data-show-export="true" 
                                    data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>
                                        <th data-field="state" data-checkbox="true"></th>
                                        <th>SL.</th>
                                        <th>Code</th>
                                        <th>Product</th>
                                        <th>Batch No.</th>
                                        <th>Expiry Date</th>
                                        <th>Stock Quantity</th>
                                        <th>Cost Price</th>
                                        <th>Sale Price</th>
                                        <th>Total Cost</th>
                                        <th>Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	@php 
                                        $i = 1; 
                                        $qty = 0; 
                                        $Qty = 0; 
                                        $cost = 0; 
                                        $price = 0; 
                                        $t_Cost = 0;
                                        $t_Price = 0;
                                    @endphp
                                    @foreach ($data as $data)
                                    <tr>
                                        <td></td>
                                        <td>{{ $i++ }}.</td>
                                        <td>{{ $data->code }}</td>
                                        <td>{{ $data->name }}</td>
                                        <td>{{ $data->batch_no }}</td>
                                        <td>{{ $data->expiry_date }}</td>
                                        <td>{{ $qty = $data->quantity }}</td>
                                        <td>{{ $data->cost }}</td>
                                        <td>{{ $data->price }}</td>
                                        <td>{{ $cost = $data->quantity * $data->cost }}</td>
                                        <td>{{ $price = $data->quantity * $data->price }}</td>
                                    </tr>
                                    @php 
                                    	$t_Cost += $cost; 
                                    	$t_Price += $price; 
                                    	$Qty += $qty; 
                                	@endphp
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="6">SubTotal : &nbsp;</td>
                                        <td>&nbsp; {{ $Qty }}</td>
                                        <td></td>
                                        <td></td>
                                        <td>&nbsp;&nbsp; {{ $t_Cost }}</td>
                                        <td>&nbsp; {{ $t_Price }}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection