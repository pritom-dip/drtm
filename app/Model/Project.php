<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $guarded = [];

    public function admin(){
        return $this->belongsTo('App\Admin');
    }
}