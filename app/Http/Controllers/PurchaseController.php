<?php

namespace App\Http\Controllers;

use App\Admin\Payment;
use Illuminate\Http\Request;
use App\Admin\Purchase;
use App\Admin\PurchaseItem;
use App\Admin\Supplier;
use Illuminate\Support\Facades\Auth;
use App\Admin\Product;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('inactiveShop');
    }
    
    public function index(Request $request)
    {
        // $request->session()->flush();
        if ($last = Purchase::all()->last()){  
            $sl = $last->id; 
        } else { 
            $sl = 0; 
        }
        $suppliers = Supplier::orderBy('id', 'DESC')
                ->where('shop', Auth::user()->id)
                ->where('status', 1)
                ->get();
        $product = Product::orderBy('products.id', 'DESC')
                ->where('products.shop', Auth::user()->id)
                ->where('products.status', 1)
                ->get();
        return view('Admin.Purchase.purchase', compact('suppliers','sl','product'));
    }

    // public function subCat(Request $request)
    // {
         
    //     $manufacturer = $request->manufacturer;
         
    //     $medicines = Product::where('manufacturer',$manufacturer)
    //                         ->get();
    //     return response()->json([
    //         'subcategories' => $subcategories
    //     ]);
    // }

    public function clientinfo(){
        $clientInfo = Supplier::where('status',1)
                                ->where('id',request()->manufacturer)
                                ->where('shop', Auth::user()->id)
                                 ->first();
        return response()->json([
                'clientInfo'=> $clientInfo
            ]);
    }

    public function getMedicine(){
        $medicines = Product::where('status',1)
                                ->where('manufacturer_id',request()->manufacturer)
                                ->where('shop', Auth::user()->id)
                                ->get();
        $medicines_html = (string)view('Admin.components.medicines_html', 
                            [
                                'medicines' => $medicines,
                            ]
                        );
        return response()->json([
            'medicines_html'=> $medicines_html

        ]);
    }

    public function getPrice(){
        $getPrice = Product::where('status',1)
                            ->where('id',request()->medicine_id)
                            ->where('shop', Auth::user()->id)
                            ->first();
        return response()->json([
                'getPrice'=> $getPrice
            ]);
    }

    public function details(Request $request)
    {
        $data = Supplier::where('id', $request->id)->pluck('mobile');
        return response()->json($data);
    }

    public function item_save(Request $request)
    {

        $supplier = Supplier::find($request->supplier);

        $data                   = new Purchase();
        $data->purchase_no      = $request->purchase_no;
        $data->supplier         = $supplier->name;
        $data->date             = $request->date;
        $data->totalQty         = $request->totalQty;
        $data->subTotal         = $request->subTotal;
        $data->discount         = $request->discount;
        $data->d_type           = $request->d_type;
        $data->payable          = $request->payable;
        $data->paid             = $request->paid;
        $data->return           = $request->return;
        $data->due              = $request->due;
        $data->p_type           = $request->p_type;
        $data->shop             = Auth::user()->id;
        $data->user             = Auth::user()->id;
        $data->save();

        if($request->due != '0')
        {
            $data               = new Payment();
            $data->date         = $request->date;
            $data->supplier     = $supplier->name;
            $data->purchase_no  = $request->purchase_no;
            $data->paid         = $request->paid;
            $data->due          = $request->due;
            $data->amount       = '0';
            $data->shop         = Auth::user()->id;
            $data->user         = Auth::user()->id;
            $data->save();
        }

        $countProduct = count($request->medicine_id);

        if($request->medicine_id){
            $postData = [];
            for ($i=0; $i <$countProduct ; $i++) { 
                $name = Product::find($request->medicine_id[$i])->name;
                $postData[] = [
                'name'          => $name,
                'code'          => $request->code[$i],
                'purchase_no'   => $request->purchase_no,
                'date'          => $request->date,
                'expiry_date'   => $request->expiry_date[$i],
                'batch_no'      => $request->batch_no[$i],
                'qty'           => $request->qty[$i],
                'cost'          => $request->cost[$i],
                'total'         => $request->total[$i],
                'shop'          => Auth::user()->id,
                'user'          => Auth::user()->id,
                ];
            }                
            PurchaseItem::insert($postData);

            $totalProduct = count($request->medicine_id);
            $stdata = [];

            for ($i=0; $i <$totalProduct ; $i++) { 
                $name    = Product::find($request->medicine_id[$i])->name;
                $price   = Product::find($request->medicine_id[$i])->seller_price;
                $minimum = Product::find($request->medicine_id[$i])->min_stock;
                $unit    = Product::find($request->medicine_id[$i])->medicine_unit;

                $stdata[] = [
                'code'      => $request->code[$i],
                'name'      => $name,
                'batch_no'  => $request->batch_no[$i],
                'quantity'  => $request->qty[$i],
                'cost'      => $request->cost[$i],
                'price'     => $price,
                'minimum'   => $minimum,
                'unit'      => $unit,
                'user'      => Auth::user()->id,
                'shop'      => Auth::user()->id,
                ];
            }  

            $totalStock = count($stdata);

            for ($i=0; $i < $totalStock ; $i++) {

                $exist = DB::table('stocks')
                        ->where('code', $stdata[$i]['code'])
                        ->first();

                if($exist == null)//if doesn't exist: create
                {
                    $insert = DB::table('stocks')->insert($stdata[$i]);
                }else //if exist: update
                {
                    //if purchase cost is same as stock cost
                    if($exist->cost == $price)
                    {
                        $update = DB::table('stocks')
                                    ->where('code', $stdata[$i]['code'])
                                    ->increment('quantity', $stdata[$i]['quantity']);
                    }
                    //if purchase cost is not same as stock cost
                    else 
                    {
                        $newCost = ($exist->cost + $price) / 2;
                        $update = DB::table('stocks')
                                    ->where('code', $stdata[$i]['code'])
                                    ->increment('quantity', $stdata[$i]['quantity']);
                        $update = DB::table('stocks')
                                    ->where('code', $stdata[$i]['code'])
                                    ->update(['cost' => $newCost]);
                    }
                }

            }  

            $totalBatch = count($request->medicine_id);
            $bdata = [];

            for ( $i = 0 ; $i < $totalBatch ; $i++ ) { 
                $name    = Product::find($request->medicine_id[$i])->name;
                $price   = Product::find($request->medicine_id[$i])->seller_price;
                $minimum = Product::find($request->medicine_id[$i])->min_stock;
                $unit    = Product::find($request->medicine_id[$i])->medicine_unit;

                $bdata[] = [
                    'name'         => $name,
                    'code'         => $request->code[$i],
                    'batch_no'     => $request->batch_no[$i],
                    'expiry_date'  => $request->expiry_date[$i],
                    'minimum'      => $minimum,
                    'quantity'     => $request->qty[$i],
                    'unit'         => $unit,
                    'cost'         => $request->cost[$i],
                    'price'        => $price,
                    'shop'         => Auth::user()->id,
                ];
            }

            $totalBatchStock = count($bdata);

            for ($i=0; $i < $totalBatchStock ; $i++) {

                $codeexist = DB::table('batch_stocks')
                        ->where('code', $bdata[$i]['code'])
                        ->first();

                if($codeexist == null) {
                    $insert = DB::table('batch_stocks')->insert($bdata[$i]);
                } else {
                    $batchexist = DB::table('batch_stocks')
                                    ->where('batch_no', $bdata[$i]['batch_no'])
                                    ->first();
                    if($batchexist == null) {
                        $insert = DB::table('batch_stocks')->insert($bdata[$i]);
                    } else {
                        $update = DB::table('batch_stocks')
                                    ->where('code', $bdata[$i]['code'])
                                    ->where('batch_no', $bdata[$i]['batch_no'])
                                    ->increment('quantity', $bdata[$i]['quantity']);
                    }
                }
                
            }
            
        }
        
        $msg = 'Products Purchased Successfully !!';
        $request->session()->flash('message', $msg);
        return redirect()->back(); 
    }

}
