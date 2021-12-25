<?php

namespace App\Http\Controllers\Backend;

use App\Model\Notice;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
/*use App\Http\Controllers\Controller*/;

class NoticeController extends Controller
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
        $query  = Notice::latest();

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

       // $this->validation($request);
        Notice::create($request -> notice);

        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function show(Notice $notice)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path .'.show', compact( "notice", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function edit(Notice $notice)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view( $this->path . '.edit',
                compact( "notice" , "breadcumbs"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Notice $notice)
    {
        //$this->validation($request, $notice->id);
        $notice->update($request -> notice);
        return redirect()->back()->with('success', $this->model. ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notice $notice)
    {
        $notice->delete();
        return redirect()->route( $this->route . '.index')
                ->with('success', $this->model .' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.notice";
        $this->model = "Notice";
        $this->route = "notice";
    }

    private function validation($request, $notice = null){
        $this->validate($request,[
            'name'  => "required|unique:notices,name," . $notice
        ]);
    }
}
