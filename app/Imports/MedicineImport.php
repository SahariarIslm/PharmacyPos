<?php

namespace App\Imports;

use App\Admin\Product;
use App\Admin\Supplier;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Auth;

class MedicineImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {

        $user_id         = Auth::user()->id;
        $manufacturer = Supplier::where('name',$row['manufacturer_name'])->first();
        $manufacturer_id = $manufacturer->id;

        return new Product([
            'user_id'            => $user_id,
            'barcode'            => $row['barcode'],
            'generic_name'       => $row['generic_name'],
            'name'               => $row['name'],
            'strength'           => $row['strength'],
            'manufacturer_id'    => $manufacturer_id,
            'seller_price'       => $row['seller_price'],
            'manufacturer_price' => $row['manufacturer_price'],
            'shop'               => $row['shop'],
        ]);
    }
}
