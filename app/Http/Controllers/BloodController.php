<?php

namespace App\Http\Controllers;

use App\Model\Blood;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BloodController extends Controller
{
    public function store(Request $request)
    {
        $this->validation($request);
        Blood::create($request->all());
        return redirect()->back()->with('success', 'Submitted successfully');
    }

    public function list()
    {
        $donators = Blood::all();
        $groupByDonators = $donators->groupby('blood_group');

        return view('frontend.bloodlist', compact( 'groupByDonators'));
    }

    public function show()
    {
        return view('frontend.donateForm');
    }

    private function validation($request, $blood = null){
        $this->validate($request,[
            'name'  => "required",
            'age'  => "required",
            'blood_group'  => "required",
            'mobile'  => "required"
        ]);
    }
}