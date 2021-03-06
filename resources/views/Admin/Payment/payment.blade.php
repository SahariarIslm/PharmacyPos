@extends('Master.main')
@section('title')
    Payment
@endsection
@section('content')

<div class="data-table-area mg-tb-15">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="sparkline13-list">
                    <div class="sparkline13-hd">
                        <div class="main-sparkline13-hd">
                            <h1 class="col-lg-4 p-0" style="padding:0px;">
                                Payment<span class="table-project-n"></span> Table
                            </h1>
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
                            {{--  <button type="button" class="btn btn-info col-lg-2 Primary" 
                                style="float:right;" data-toggle="modal" 
                                data-target="#PrimaryModalalert">Add Payment
                            </button>  --}}
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <div class="modal modal-adminpro-general default-popup-PrimaryModal fade" 
                        id="PrimaryModalalert" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            <form action="{{ route('payment.store') }}" method="POST">
                                @csrf
                                <div class="modal-close-area modal-close-df">
                                    <a class="close" data-dismiss="modal" href="#">
                                        <i class="fa fa-close"></i></a>
                                </div>
                                <div class="modal-header header-color-modal bg-color-1">
                                    <h4 class="modal-title">Add Payment Info</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Date <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="date" value="{{ $today }}"
                                                    name="date" class="form-control" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Supplier <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <select name="supplier" class="form-control" required>
                                                    <option value="">--- Select Supplier ---</option>
                                                    @foreach ($supplier as $supplier)
                                                    <option value="{{ $supplier->name }}">{{ $supplier->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Due Amount <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input name="due" type="text" 
                                                    class="form-control" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Payment Amount <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input name="amount" type="text" 
                                                    class="form-control" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Details <span class="table-project-n"></span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input name="details" class="form-control"/>
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

                    <div class="modal modal-adminpro-general default-popup-PrimaryModal fade" 
                        id="InformationproModalhdbgcl" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            <form id="updatE">@csrf
                                <div class="modal-close-area modal-close-df">
                                    <a class="close" data-dismiss="modal" href="#">
                                        <i class="fa fa-close"></i></a>
                                </div>
                                <div class="modal-header header-color-modal bg-color-1">
                                    <h4 class="modal-title">Edit Payment Info</h4>
                                </div>
                                <div class="modal-body">
                                    <input name="id" class="id" type="hidden"/>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Date <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="date" class="form-control date" required/>
                                            </div>
                                        </div>
                                    </div>
                                    {{-- <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Supplier <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <select class="form-control supplier" required>
                                                    <option value="">--- Select Supplier ---</option>
                                                    @foreach ($supplie as $supplie)
                                                    <option value="{{ $supplie->name }}">{{ $supplie->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div> --}}
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Total Paid <span class="table-project-n"></span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="text" class="form-control paid" readonly/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Previous Paid <span class="table-project-n"></span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="text" class="form-control pre" readonly/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Due Amount <span class="table-project-n"></span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="text" class="form-control due" readonly/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Payment Amount <span class="table-project-n">*</span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input type="text" class="form-control amount" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group-inner">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="login2 pull-right pull-right-pro">
                                                    Details <span class="table-project-n"></span>
                                                </label>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                <input class="form-control details"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-warning btn-sm" data-dismiss="modal">Close</button>
                                    <button class="btn btn-success btn-sm" type="submit">Update</button>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>

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
                                        <th data-field="sl">SL.</th>
                                        <th data-field="date" data-editable="false">Date</th>
                                        <th data-field="supplier" data-editable="false">Supplier</th>
                                        <th data-field="purchase_no" data-editable="false">Purchase No.</th>
                                        <th data-field="paid" data-editable="false">Paid</th>
                                        <th data-field="due" data-editable="false">Due</th>
                                        <th data-field="amount" data-editable="false">Last Payment</th>
                                        <th data-field="details" data-editable="false">Details</th>
                                        <th data-field="action">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1;?>
                                    @foreach ($data as $data)
                                    <tr>
                                        <td></td>
                                        <td>{{ $i++ }}.</td>
                                        <td>{{ $data->date }}</td>
                                        <td>{{ $data->supplie }}</td>
                                        <td>{{ $data->purchase_no }}</td>
                                        <td>{{ $data->paid }}</td>
                                        <td>{{ $data->due }}</td>
                                        <td>{{ $data->amount }}</td>
                                        <td>{{ $data->details }}</td>
                                        <td class="datatable-ct">
                                            <button type="button" value="{{ $data->id }}"
                                                class="btn btn-primary ediT btn-xs" 
                                                data-toggle="modal" 
                                                data-target="#InformationproModalhdbgcl">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $('.ediT').on('click', function () {
            var id = $(this).val();
            $.ajax({
                type: "GET",
                url: "{{ route('payment.edit') }}",
                data: {id: id},
                success: function (data) {
                    $('.id').val(data[0]['id']);
                    $('.date').val(data[0]['date']);
                    $('.supplier').val(data[0]['supplier']);
                    $('.paid').val(data[0]['paid']);
                    $('.due').val(data[0]['due']);
                    $('.pre').val(data[0]['amount']);
                    $('.details').val(data[0]['details']);
                }
            });
        });
        $('#updatE').on('submit', function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "{{ route('payment.update') }}",
                data: {
                    '_token'    : $('input[name=_token]').val(),
                    'id'        : $(".id").val(),
                    'date'      : $(".date").val(),
                    'paid'      : $(".paid").val(),
                    'due'       : $(".due").val(),
                    'amount'    : $(".amount").val(),
                    'details'   : $(".details").val(),
                },
                success: function () {
                    $('#InformationproModalhdbgcl').modal('hide');
                    location.reload();
                },
                error: function (error) {
                    console.log(error);
                    alert('Data Not Saved');
                }
            });
        });
    });
    $('.deletE').on('click', function () {
        var id = $(this).data("id");
        $.ajax(
            {
                url: "{{ route('payment.destroy') }}",
                type: 'GET',
                data: {
                    "id": id,
                },
                success: function (){
                    console.log("Data Deleted Successfully");
                    location.reload();
                }
            });
    });
</script>

@endsection