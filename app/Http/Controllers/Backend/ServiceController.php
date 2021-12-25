<?php

namespace App\Http\Controllers\Backend;

use App\Model\Service;
use App\Model\Team;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ServiceController extends Controller
{
    private $path;
    private $model;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query  = Service::latest();

        if(!empty($request->field_name) && !empty($request->value)){
            $query->where($request->field_name,'like','%'.$request->value.'%');
        }

        $breadcumbs = $this->breadcumbs($this->model, 'index');
        $datas      = $query->paginate(10);

        return view( $this->path .'.index', compact('datas', 'breadcumbs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $breadcumbs = $this->breadcumbs($this->model, 'create');
        return view( $this->path . '.create', compact('breadcumbs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validation($request);

        $data["title"] = $request->input("title");
        $data["short_desc"] = $request->input("short_desc");
        $data["description"] = $request->input("description");
        $data["limit"] = $request->input("limit");
        $data["image"] = "user1-128x128.jpg";
        if($request->hasFile('image')){
            $data["image"] = Team::UploadImage($request->image);   
        }

        Service::create($data);

        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function show(Service $service)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "service", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function edit(Service $service)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit', 
                compact( "service" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Service $service)
    {
        $this->validation($request, $service->id);
        $service->update($request->all());

        $data["title"] = $request->input("title");
        $data["short_desc"] = $request->input("short_desc");
        $data["description"] = $request->input("description");
        $data["limit"] = $request->input("limit");
        $data["image"] = $service->image;
       
        if($request->hasFile('image')){
            $data["image"] = Team::UploadImage($request->image);   
        }
        $service->update($data);

        return redirect()->back()->with('success', $this->model. ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function destroy(Service $service)
    {
        $service->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.service";
        $this->model = "Service";
        $this->route = "service";
    }

    private function validation($request, $service = null){
        $this->validate($request,[
            'title'  => "required|unique:services,title," . $service,
            'limit'  => "numeric"
        ]);
    }
}