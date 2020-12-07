<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';

    protected $fillable = ['user_id' ,'barcode' , 'name', 'category', 'medicine_shelf', 'strength', 'medicine_unit', 'generic_name', 'min_stock', 'medicine_type', 'details', 'vat', 'tax', 'seller_price', 'manufacturer_id', 'manufacturer_price', 'status', 'shop' ];

    public function category()
    {
        return $this->belongsTo('App\Admin\Category');
    }

    public function medicineShelf()
    {
        return $this->belongsTo('App\Admin\MedicineShelf');
    }

    public function medicineUnit()
    {
        return $this->belongsTo('App\Admin\MedicineUnit');
    }

    public function medicineType()
    {
        return $this->belongsTo('App\Admin\MedicineType');
    }

    public function manufacturer()
    {
        return $this->belongsTo('App\Admin\Supplier');
    }
}
