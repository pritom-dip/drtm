<?php

namespace App\Http\Controllers\Backend;

use App\Model\Shava;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
/*use App\Http\Controllers\Controller*/;

class ShavaController extends Controller
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
        $query  = Shava::latest();

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
        $information = $request->input('information')[0]['information'];

        if (count($information) > 0) {
            $information = json_encode($information, true);

        }


        //$this->validation($request);
        Shava::create(['data' => $information]);

        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Shava  $shava
     * @return \Illuminate\Http\Response
     */
    public function show(Shava $shava)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "shava", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Shava  $shava
     * @return \Illuminate\Http\Response
     */
    public function edit(Shava $shava)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit',
                compact( "shava" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Shava  $shava
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Shava $shava)
    {
        $information = $request->input('information')[0]['information'];

        if (count($information) > 0) {
            $information = json_encode($information, true);

        }

        //$this->validation($request, $shava->id);
        $shava->update(['data' => $information]);
        return redirect()->back()->with('success', $this->model. ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Shava  $shava
     * @return \Illuminate\Http\Response
     */
    public function destroy(Shava $shava)
    {
        $shava->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.shava";
        $this->model = "Shava";
        $this->route = "shava";
    }

    private function validation($request, $shava = null){
        $this->validate($request,[
            'name'  => "required|unique:shavas,name," . $shava
        ]);
    }
}
