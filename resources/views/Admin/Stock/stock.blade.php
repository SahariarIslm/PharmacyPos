@extends('Master.main')
@section('title')
    Current Stock
@endsection
@section('content')

    <style type="text/css">
        .orng{
            color: orange;
        }
        .bkorng{
            background-color: orange;
        }
    </style>

<div class="data-table-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="sparkline13-list">
                    <div class="sparkline13-hd">
                        <div class="main-sparkline13-hd">
                            <div style="float:right;">
                                *<small class="bkorng">Quantity Less Than Minimum Stock</small> 
                            </div>
                            <h1>Current Stock</h1>
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
                                        <th>Medicine Name</th>
                                        <th>Generic Name</th>
                                        <th>Unit Type</th>
                                        <th>Minimum Stock</th>
                                        <th>Stock Quantity</th>
                                        <th>Cost Price</th>
                                        <th>Sale Price</th>
                                        <th>Total Cost Price</th>
                                        <th>Total Sale Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $i = 1;
                                    $net_total_cost = 0;
                                    $net_total_price = 0;
                                    ?>
                                    @foreach ($data as $data)
                                    @if($data->quantity <= $data->minimum)
                                    <tr class="bkorng">
                                        <td></td>
                                        <td>{{ $i++ }}.</td>
                                        <td>{{ $data->code }}</td>
                                        <td>{{ $data->name }}</td>
                                        <td>{{ $data->generic_name }}</td>
                                        <td>{{ $data->unit }}</td>
                                        <td>{{ $data->minimum }}</td>
                                        <td>{{ $data->quantity }}</td>
                                        <td>{{ $data->cost }}</td>
                                        <td>{{ $data->price }}</td>
                                        <td>
                                            <?php 
                                                $total_cost = $data->cost*$data->quantity ;
                                                $net_total_cost += $total_cost;
                                                echo $total_cost;
                                            ?>
                                        </td>
                                        <td>
                                            <?php 
                                                $total_Sale = $data->price*$data->quantity ;
                                                $net_total_price += $total_Sale;
                                                echo $total_cost;
                                            ?>
                                        </td>
                                    </tr>
                                    @else
                                    <tr>
                                        <td></td>
                                        <td>{{ $i++ }}.</td>
                                        <td>{{ $data->code }}</td>
                                        <td>{{ $data->name }}</td>
                                        <td>{{ $data->generic_name }}</td>
                                        <td>{{ $data->unit }}</td>
                                        <td>{{ $data->minimum }}</td>
                                        <td>{{ $data->quantity }}</td>
                                        <td>{{ $data->cost }}</td>
                                        <td>{{ $data->price }}</td>
                                        <td>
                                            <?php 
                                                $total_cost = $data->cost*$data->quantity ;
                                                echo $total_cost;
                                            ?>
                                        </td>
                                        <td>
                                            <?php 
                                                $total_Sale = $data->price*$data->quantity ;
                                                echo $total_cost;
                                            ?>
                                        </td>
                                    </tr>
                                    @endif
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="7">Total : &nbsp;</td>
                                        <td class="text- center">&nbsp; &nbsp; {{ $Qty }}</td>
                                        <td></td>
                                        <td></td>
                                        <td class="text- center"><?php echo $net_total_cost; ?></td>
                                        <td class="text- center"><?php echo $net_total_price; ?></td>
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