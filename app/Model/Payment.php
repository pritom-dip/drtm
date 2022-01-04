<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $guarded = [];

    public function service(){
        return $this->belongsTo("App\Model\Service");
    }

    public function user(){
        return $this->belongsTo("App\User");
    }
}