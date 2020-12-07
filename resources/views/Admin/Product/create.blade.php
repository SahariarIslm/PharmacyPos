@extends('Master.main')
@section('title')
    Product
@endsection
@section('content')

<div class="data-table-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">              
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="">
                    <div class="sparkline12-hd">
                        <div class="main-sparkline12-hd">
                            <h1>Add Medicine</h1>

                            <div class="container col-lg-4">
                                @if(session('success'))
                                <div class="alert alert-dismissible alert-success">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>{{ session('success') }}</strong>
                                </div>      
                                @elseif(session('message'))
                                <div class="alert alert-dismissible alert-info">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>{{ session('message') }}</strong>
                                </div>  
                                @elseif(session('danger'))
                                <div class="alert alert-dismissible alert-danger">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>{{ session('danger') }}</strong>
                                </div>      
                                @endif
                            </div>
                            
                        </div>
                    </div>
                    <div class="sparkline12-graph">
                        <div class="basic-login-form-ad">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="all-form-element-inner">
                                        <form action="{{ route('product.store') }}" method="POST" id="myForm">
                                            @csrf
                                            <div class="sparkline12-list col-md-6" style="width: 550px;">
                                                <div class="form-group-inner">
                                                    <?php
                                                        use App\Admin\Product;
                                                        $count = count(Product::whereDate('created_at', date('Y-m-d'))->get());
                                                        $s = $count + 1;
                                                        $bata = date('Ymd') . $s;
                                                    ?>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Barcode:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="barcode" class="form-control" value="{{ $bata }}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Category:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <div class="form-select-list">
                                                                    <select class="form-control custom-select-value" name="category">
                                                                        <option>Select Category</option>
                                                                        @foreach($categories as $category)
                                                                        <option value="{{ $category->name }}">{{ $category->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Strength:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" name="strength" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Generic Name:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" name="generic_name" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Medicine Type:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <div class="form-select-list">
                                                                    <select class="form-control custom-select-value" name="medicine_type">
                                                                        <option>Select Medicine Type</option>
                                                                        @foreach($medicine_types as $medicine_type)
                                                                            <option value="{{ $medicine_type->name }}">{{ $medicine_type->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Details:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <textarea class="form-control" name="details" rows="1"></textarea>
                                                            </div>
                                                        </div>   
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Seller Price:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="seller_price" class="form-control" />
                                                            </div>
                                                        </div> 
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Manufacturer:</label>
                                                            </div>
                                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-10" style="padding-right:0px;" >
                                                                <div class="form-select-list">
                                                                    <select class="form-control custom-select-value" name="manufacturer_id">
                                                                        <option>Select Manufacturer</option>
                                                                        @foreach($manufacturers as $manufacturer)
                                                                        <option value="{{ $manufacturer->id }}">{{ $manufacturer->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding-left:0px;">
                                                                <div class="form-select-list">
                                                                    <button type="button" class="btn btn-info col-lg-12 Primary" style="float:right; display: inline" data-toggle="modal" data-target="#PrimaryModalalert"><i class="fa fa-plus" style="font-size: 20px" aria-hidden="true"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>  
                                            </div>

                                            <div class="sparkline12-list col-md-6" style="width: 550px; margin-left: 10px">
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Medicine Name:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12" style="position: relative; display: inline-block; z-index: 1;">
                                                                <input type="text" name="name" class="form-control" id="search"/>
                                                                <span id="search1" style="position: absolute;display: none;background-color: #f9f9f9;min-width: 390px;padding: 12px 16px;"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Medicine Shelf:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <div class="form-select-list">
                                                                    <select class="form-control custom-select-value" name="medicine_shelf">
                                                                            <option>Select Medicine Shelf</option>
                                                                        @foreach($medicine_shelves as $medicine_shelf)
                                                                            <option value="{{ $medicine_shelf->name }}">{{ $medicine_shelf->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Unit:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <div class="form-select-list">
                                                                    <select class="form-control custom-select-value" name="medicine_unit">
                                                                        <option>Select Medicine Unit</option>
                                                                        @foreach($medicine_units as $medicine_unit)
                                                                            <option value="{{ $medicine_unit->name }}">{{ $medicine_unit->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Minimum Stock:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="min_stock" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Vat:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="vat" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Tax:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="tax" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group-inner">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2">Manufacturer Price:</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <input type="number" name="manufacturer_price" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="sparkline13-hd">
                                                    <div class="main-sparkline13-hd">
                                                        <button type="submit" name="Submit" class="btn btn-info col-sm-3 Primary" style="margin-left: 5px; float: right;">Save Product
                                                        </button>
                                                        <a class="btn btn-danger col-sm-3 Primary" style="margin-left: 5px; float: right;" href="{{ route('product.index') }}" role="button">Go Back </a>
                                                        <a class="btn btn-primary col-sm-3 Primary" style="margin-left: 5px; float: right;" onclick="myFunction()" href="#" role="button">Clear </a>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="PrimaryModalalert" class="modal modal-adminpro-general default-popup-PrimaryModal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
        <form action="{{ route('supplier.store') }}" method="POST">
            @csrf
            <div class="modal-close-area modal-close-df">
                <a class="close" data-dismiss="modal" href="#">
                    <i class="fa fa-close"></i>
                </a>
            </div>
            <div class="modal-header header-color-modal bg-color-1">
                <h4 class="modal-title">Add Menufecturer Info</h4>
            </div>
            <div class="modal-body">
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">
                                Name <span class="table-project-n">*</span>
                            </label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <input type="text" name="name" class="form-control" required/>
                        </div>
                    </div>
                </div>
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">
                                Mobile <span class="table-project-n"></span>
                            </label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <input type="text" name="mobile" class="form-control"/>
                        </div>
                    </div>
                </div>
                
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">
                                Address <span class="table-project-n"></span>
                            </label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <textarea type="text" name="address" class="form-control"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">
                                Balance <span class="table-project-n"></span>
                            </label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <input type="number" name="balance" class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning btn-sm" type="button"data-dismiss="modal">Close</button>
                <button class="btn btn-danger btn-sm" type="reset">Clear</button>
                <button class="btn btn-success btn-sm" type="submit">Submit</button>
            </div>
        </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#search').on('keyup',function(){
            $value=$(this).val();
            if ($value) {
                $('#search1').show();
                $.ajax({
                    type : 'get',
                    url : '{{URL::to('product/search')}}',
                    data:{'search':$value},
                    success:function(data){
                        $('#search1').html(data);
                    }
                });
            }else{
                $('#search1').hide();
            }     
        });
        $("#search").focusout(function(){
            $('#search1').hide();
        });
    });

    function myFunction(){
        document.getElementById("myForm").reset();
    }
</script>
<script type="text/javascript">
    $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });
</script>
@endsection