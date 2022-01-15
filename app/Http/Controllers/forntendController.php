<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Service;
use App\Model\Project;
use App\Model\Team;

class forntendController extends Controller
{
    // ---------home-----------
    public function home()
    {
        $services   = Service::take(3)->get();
        $projects   = Project::latest()->get();
        $teams      = Team::latest()->get();
        return view('frontend.index', compact('services', 'projects', 'teams'));
    }

    // ---------about-----------
    public function about()
    {
        return view('frontend.about');
    }

    // ---------services-----------
    public function services()
    {
        $services   = Service::latest()->get();
        return view('frontend.services', compact('services'));
    }

    // ---------services-----------
    public function gallery()
    {
        return view('frontend.gallery');
    }

    // ---------contact-----------
    public function contact()
    {
        return view('frontend.contact');
    }
    
}
