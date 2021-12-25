<?php

namespace App\Http\Controllers\Backend;

use App\Model\File;
use App\Http\Controllers\Controller;
use App\Model\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
/*use App\Http\Controllers\Controller*/;

class FileController extends Controller
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
        $query  = File::latest() -> where('status', 'a');

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
        $category = Category::latest() -> get();
        $breadcumbs = $this->breadcumbs($this->model, 'create');
        return view( $this->path . '.create', compact('category','breadcumbs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $file_data = $request -> data;

        if (!empty($request->file('file'))) {
            $file_data['path'] = Storage::putFile('upload/files', $request->file('file'));
        }



        //$this->validation($request);
        File::create($file_data);

        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\File  $file
     * @return \Illuminate\Http\Response
     */
    public function show(File $file)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "file", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\File  $file
     * @return \Illuminate\Http\Response
     */
    public function edit(File $file)
    {
        $category = Category::latest() -> get();
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit',
                compact( "category","file" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\File  $file
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, File $file)
    {
        $file_data = $request -> data;

        if (!empty($request->file('file'))) {
            $file_data['path'] = Storage::putFile('upload/files', $request->file('file'));
        }

        //$this->validation($request, $file->id);
        $file->update($file_data);
        return redirect()->back()->with('success', $this->model. ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\File  $file
     * @return \Illuminate\Http\Response
     */
    public function destroy(File $file)
    {
        $file->delete(['status' => 'd']);
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.file";
        $this->model = "File";
        $this->route = "file";
    }

    private function validation($request, $file = null){
        $this->validate($request,[
            'name'  => "required|unique:files,name," . $file
        ]);
    }
}
