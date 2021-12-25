<?php

namespace App\Http\Controllers\Backend;

use App\Model\Structure;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
/*use App\Http\Controllers\Controller*/;

class StructureController extends Controller
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
        $query  = Structure::latest();


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
        if (!empty($request->file('image'))) {
            $data = Storage::putFile('upload/structure', $request->file('image'));

            Structure::create(['image' => $data]);
            return redirect()->back()->with('success', $this->model . ' Updated Successfully');
        } else {
            return redirect()->back()->with('error', $this->model . 'File is empty');
        }

        // $this->validation($request);


        // return redirect()->route( $this->route . '.index')
        //         ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Structure  $structure
     * @return \Illuminate\Http\Response
     */
    public function show(Structure $structure)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "structure", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Structure  $structure
     * @return \Illuminate\Http\Response
     */
    public function edit(Structure $structure)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit',
                compact( "structure" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Structure  $structure
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Structure $structure)
    {
        if (!empty($request->file('image'))) {
            $data = Storage::putFile('upload/structure', $request->file('image'));

            $structure->update(['image' => $data]);
            return redirect()->back()->with('success', $this->model . ' Updated Successfully');
        } else {
            return redirect()->back()->with('error', $this->model . 'File is empty');
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Structure  $structure
     * @return \Illuminate\Http\Response
     */
    public function destroy(Structure $structure)
    {
        $structure->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.structure";
        $this->model = "Structure";
        $this->route = "structure";
    }

    private function validation($request, $structure = null){
        $this->validate($request,[
            'name'  => "required|unique:structures,name," . $structure
        ]);
    }
}
