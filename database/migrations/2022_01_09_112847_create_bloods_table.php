<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBloodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bloods', function (Blueprint $table) {
            $table->id();
            $table->string("name");
            $table->integer("age");
            $table->string("blood_group");
            $table->string("mobile");
            $table->string("gender")->nullable();
            $table->string("height")->nullable();
            $table->string("weight")->nullable();
            $table->string("address")->nullable();
            $table->string("city")->nullable();
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
        Schema::dropIfExists('bloods');
    }
}
