<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->nullable();
            $table->bigInteger('barcode')->nullable();
            $table->string('name')->nullable();
            $table->string('category')->nullable();
            $table->string('medicine_shelf')->nullable();
            $table->string('strength')->nullable();
            $table->string('medicine_unit')->nullable();
            $table->string('generic_name')->nullable();
            $table->string('min_stock')->nullable();
            $table->string('medicine_type')->nullable();
            $table->text('details')->nullable();
            $table->decimal('vat',20,2)->nullable();
            $table->decimal('tax',20,2)->nullable();
            $table->decimal('seller_price',20,2)->nullable();
            $table->unsignedBigInteger('manufacturer_id')->nullable();
            $table->decimal('manufacturer_price',20,2)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->integer('shop')->nullable();
            $table->timestamps();

            $table->foreign('manufacturer_id')->references('id')->on('suppliers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
