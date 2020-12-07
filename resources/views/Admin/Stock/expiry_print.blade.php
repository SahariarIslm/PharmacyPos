<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="{{asset('/public')}}/Master/css/bootstrap.min.css">
    <style type="text/css">
        @media print {
            @page {
                size: auto;
            }
        }
    </style>
    
</head>
<body onload="window.print();window.history.back()">
    <div style="text-align:center;">
        @foreach ($company as $com)
        <h2>{{ $com->business_name }}</h2>
        <h6>Mobile No. : {{ Auth::user()->mobile }}</h6>
        <h6>{{ $com->address }}, {{ $com->area }}</h6>
        @endforeach
        <h4><u>Batch Wise 3 months Expiry Stock Report</u></h4>
    </div>
    <br>
    <table class="table table-bordered">
        <thead>
            <tr>
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
            @foreach ($bdata as $data)
            <tr>
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
                <td class="text-right" colspan="5">SubTotal :</td>
                <td>{{ $Qty }}</td>
                <td></td>
                <td></td>
                <td>{{ $t_Cost }}</td>
                <td>{{ $t_Price }}</td>
            </tr>
        </tfoot>
    </table>
    <div class="navbar-fixed-bottom">
        <div style="float:left;">
                Printed By : {{ config('app.name') }}
        </div>
        <div style="float:right;">
            <?php echo "Date & Time : " . date("D, d M Y h:i:s a"); ?>
        </div>
    </div>
</body>
</html>