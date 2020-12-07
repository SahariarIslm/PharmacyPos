<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('batch_stocks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->nullable();
            $table->string('code')->nullable();
            $table->string('batch_no')->nullable();
            $table->date('expiry_date')->nullable();
            $table->integer('minimum')->nullable();
            $table->integer('quantity')->nullable();
            $table->string('unit')->nullable();
            $table->decimal('cost', 20,2)->nullable();
            $table->decimal('price', 20,2)->nullable();
            $table->integer('shop');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('batch_stocks');
    }
}
