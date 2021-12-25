<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $guarded = [];

    public static function UploadImage($image){

        $newImg =  $image->getClientOriginalName();
        $image_icon = explode(".", $newImg);
        $image_name = $image_icon[0];
        $image_extension = array_slice($image_icon , -1, 1);
        $fileName = $image_name.time().'.'.$image_extension[0];

        $image->storeAs('images', $fileName, 'public');
        return $fileName; 
    }
}