<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $guarded = [];

    public function payments(){
        return $this->hasMany("App\Model\Payment");
    }

    public static function getAllPayments($id){
        $amount = 0;
        $service = Service::find($id);
        if(count($service->payments) > 0){
            foreach($service->payments as $payment){
                $amount += $payment->amount;
            }
        }
        return $amount;
    }
}