<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin\Delivery;
use Illuminate\Support\Facades\Auth;

class DeliveryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('inactiveShop');
        $this->middleware('can:admin');
    }

    public function index()
    {
        $data = Delivery::orderBy('id', 'DESC')
                ->where('shop', Auth::user()->id)
                ->get();
        return view('Admin.Delivery.delivery', compact('data'));
    }

    public function store(Request $request)
    {
        $data           = new Delivery();
        $data->name     = $request->name;
        $data->mobile   = $request->mobile;
        $data->address  = $request->address;
        $data->status   = '1';
        $data->shop     = Auth::user()->id;
        $data->save();
        return redirect()->back()->with('message','Delivery Company Added Successfully');
    }

    public function edit(Request $request)
    {
        $data = Delivery::where('id', $request->id)->get();
        return response()->json($data);
    }

    public function update(Request $request)
    {
        Delivery::where('id',$request->id)
                ->update([
                        'name'    => $request->name,
                        'mobile'  => $request->mobile,
                        'address' => $request->address,
                    ]);
        return redirect()->back()->with('message','Delivery Company Updated Successfully');
    }

    public function status(Request $request)
    {
        $data = Delivery::find($request->id);
        if ($data->status == '1') {
            $data->status = '0';    
        }
        else{   
            $data->status = '1';    
        }
        $data->save();
        return redirect()->back()->with('status','Delivery Company Status Changed Successfully');
    }

    public function destroy(Request $request)
    {
        $data = Delivery::find($request->id);
        $data->delete();
        return redirect()->back()->with('danger','Delivery Company Deleted Successfully');
    }

}
