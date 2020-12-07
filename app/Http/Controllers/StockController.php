<?php

namespace App\Http\Controllers;

use App\Admin\Shop;
use Illuminate\Http\Request;
use App\Admin\Stock;
use Illuminate\Support\Facades\Auth;
use DB;

class StockController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('inactiveShop');
    }

    public function index()
    {
        $data = Stock::orderBy('stocks.id', 'DESC')
                ->where('stocks.shop', Auth::user()->id)
                ->where('stocks.quantity','!=', 0)
                ->leftJoin('products','stocks.code','products.barcode')
                ->leftJoin('categories','products.category','categories.id')
                ->select('stocks.*','categories.name as cat_name','products.generic_name as generic_name')
                ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.stock', compact('data','Qty','Cost','Price'));
    }

    public function minimum()
    {
        $data = Stock::orderBy('stocks.id', 'DESC')
                ->where('stocks.shop', Auth::user()->id)
                ->whereColumn('stocks.quantity','<=','stocks.minimum')
                ->leftJoin('products','stocks.code','products.barcode')
                ->leftJoin('categories','products.category','categories.id')
                ->select('stocks.*','categories.name as cat_name')
                ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.minimum', compact('data','Qty','Cost','Price'));
    }

    public function minimum_print()
    {
        $company = Shop::where('user_id', Auth::user()->id)->get();
        $data = Stock::orderBy('stocks.id', 'DESC')
                ->where('stocks.shop', Auth::user()->id)
                ->whereColumn('stocks.quantity','<=','stocks.minimum')
                ->leftJoin('products','stocks.code','products.code')
                ->leftJoin('categories','products.category','categories.id')
                ->select('stocks.*','categories.name as cat_name')
                ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.minimum_print', compact('company','data','Qty','Cost','Price'));
    }

    public function batch_wise()
    {
        $data = DB::table('batch_stocks')
                    ->orderBy('id', 'DESC')
                    ->where('quantity','>',0)
                    ->where('shop', Auth::user()->id)
                    ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.batch_wise', compact('data','Qty','Cost','Price'));
    }

    public function expiry()
    {
        $expired = date('Y-m-d', strtotime('+ 90 days'));
        $bdata = DB::table('batch_stocks')
                    ->orderBy('id', 'DESC')
                    ->where('shop', Auth::user()->id)
                    ->where('expiry_date', '<=', $expired)
                    ->get();
        return view('Admin.Stock.expiry', compact('bdata'));
    }

    public function expiry_print()
    {
        $company = Shop::where('user_id', Auth::user()->id)->get();
        $expired = date('Y-m-d', strtotime('+ 90 days'));
        $bdata   = DB::table('batch_stocks')
                        ->orderBy('id', 'DESC')
                        ->where('shop', Auth::user()->id)
                        ->where('expiry_date', '<=', $expired)
                        ->get();
        return view('Admin.Stock.expiry_print', compact('bdata','company'));
    }

    public function expired()
    {
        $today = date('Y-m-d');
        $data = DB::table('batch_stocks')
                    ->orderBy('id', 'DESC')
                    ->where('shop', Auth::user()->id)
                    ->where('expiry_date', '<', $today)
                    ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.expired', compact('data','Qty','Cost','Price'));
    }
    public function expired_print()
    {
        $company = Shop::where('user_id', Auth::user()->id)->get();
        $today = date('Y-m-d');
        $data = DB::table('batch_stocks')
                    ->orderBy('id', 'DESC')
                    ->where('shop', Auth::user()->id)
                    ->where('expiry_date', '<', $today)
                    ->get();
        $Qty = $data->sum('quantity');
        $Cost = $data->sum('cost');
        $Price = $data->sum('price');
        return view('Admin.Stock.expired_print', compact('data','Qty','Cost','Price','company'));
    }
    
}
