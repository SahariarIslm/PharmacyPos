<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin\Customer;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class CustomerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('inactiveShop');
    }

    public function index()
    {
        // if(Gate::denies('admin')){
            $data = Customer::orderBy('id', 'DESC')
                    ->where('shop', Auth::user()->id)
                    ->get();
            return view('Admin.Customer.customer', compact('data'));
        // }
        // return redirect()->back()->with('message','You Do not Have Access !!!');
    }

    public function store(Request $request)
    {
        $data = new Customer();
        $data->name = $request->name;
        $data->mobile = $request->mobile;
        $data->address = $request->address;
        $data->balance = $request->balance;
        $data->status = '1';
        $data->shop = Auth::user()->id;
        $data->save();
        return redirect()->back()->with('message','Customer Added Successfully');
    }

    public function edit(Request $request)
    {
        $data = Customer::where('id', $request->id)->get();
        return response()->json($data);
    }

    public function update(Request $request)
    {
        Customer::where('id',$request->id)
            ->update([
                    'name'    => $request->name,
                    'mobile'  => $request->mobile,
                    'address' => $request->address,
                    'balance' => $request->balance,
                ]);
        return redirect()->back()->with('message','Customer Updated Successfully');
    }

    public function status(Request $request)
    {
        $data = Customer::find($request->id);
        if ($data->status == '1') {
            $data->status = '0';    
        }
        else{   
            $data->status = '1';    
        }
        $data->save();
        return redirect()->back()->with('status','Customer Status Changed Successfully');
    }

    public function destroy(Request $request)
    {
        $data = Customer::find($request->id);
        $data->delete();
        return redirect()->back()->with('danger','Customer Deleted Successfully');
    }

}
