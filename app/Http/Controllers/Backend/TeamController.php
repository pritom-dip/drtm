<?php

namespace App\Http\Controllers\Backend;

use App\Model\Team;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TeamController extends Controller
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
        $query  = Team::latest();

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
        $data["designation"] = $request->input("designation");
        $data["image"] = "";
        if($request->hasFile('image')){
            $data["image"] = Team::UploadImage($request->image);   
        }
        Team::create($data);

        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function show(Team $team)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "team", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function edit(Team $team)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit', 
                compact( "team" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Team $team)
    {
        $this->validation($request, $team->id);
        $data["title"] = $request->input("title");
        $data["designation"] = $request->input("designation");
        $data["image"] = $team->image;
        if($request->hasFile('image')){
            $data["image"] = Team::UploadImage($request->image);   
        }
        $team->update($data);

        return redirect()->back()->with('success', $this->model. ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function destroy(Team $team)
    {
        $team->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.team";
        $this->model = "Team";
        $this->route = "team";
    }

    private function validation($request, $team = null){
        $this->validate($request,[
            'title'  => "required|unique:teams,title," . $team
        ]);
    }
}