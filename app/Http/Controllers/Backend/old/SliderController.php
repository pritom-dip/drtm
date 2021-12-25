<?php

namespace App\Http\Controllers\Backend;

use App\Model\Slider;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
/*use App\Http\Controllers\Controller*/;

class SliderController extends Controller
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
        $query  = Slider::latest();

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
        if($request -> hasFile('photo')){

            $count = count($request -> photo);
            $imag = $request -> photo;

           for ($i=0; $i < $count; $i++) {

                    $data= Storage::putFile('upload/sliders', $imag[$i]);
                    //$this->validation($request);
                    Slider::create(['image' => $data]);

                    }
                    return redirect()->route( $this->route . '.index')
                            ->with('success', $this->model . ' successfully created');
        }else{
                return redirect()->route( $this->route . '.create')
                        ->with('error', $this->model . 'Image Fild is empty');
            }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Slider $slider)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "slider", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit',
                compact( "slider" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {

        if (!empty($request->file('image'))) {
            $data = Storage::putFile('upload/sliders', $request->file('image'));

            $slider->update(['image' => $data]);
            return redirect()->back()->with('success', $this->model. ' Updated Successfully');
        }else{
            return redirect()->back()->with('error', $this->model. 'Nothing to update');
        }




    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        $slider->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.sliders";
        $this->model = "Slider";
        $this->route = "slider";
    }

    private function validation($request, $slider = null){
        $this->validate($request,[
            'name'  => "required|unique:sliders,name," . $slider
        ]);
    }
}
