<?php

namespace App\Http\Controllers\Backend;

use App\model\Gallery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class GalleryController extends Controller
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
        $query  = Gallery::latest();

        if (!empty($request->field_name) && !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }

        $breadcumbs = $this->breadcumbs($this->model, 'index');
        $datas      = $query->paginate(10);

        return view($this->path . '.index', compact('datas', 'breadcumbs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $breadcumbs = $this->breadcumbs($this->model, 'create');
        return view($this->path . '.create', compact('breadcumbs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($request->hasFile('photo')) {

            $count = count($request->photo);
            $imag = $request->photo;

            for ($i = 0; $i < $count; $i++) {

                $data = Storage::putFile('upload/Gallerys', $imag[$i]);
                Gallery::create(['image' => $data]);
            }
            return redirect()->route($this->route . '.index')
                ->with('success', $this->model . ' successfully created');
        } else {
            return redirect()->route($this->route . '.create')
                ->with('error', $this->model . 'Image Fild is empty');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\model\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function show(Gallery $gallery)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path . '.show', compact("gallery", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\model\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function edit(Gallery $gallery)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view(
            $this->path . '.edit',
            compact("gallery", "breadcumbs")
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\model\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Gallery $gallery)
    {
        if (!empty($request->file('image'))) {
            $data = Storage::putFile('upload/Gallerys', $request->file('image'));

            $gallery->update(['image' => $data]);
            return redirect()->back()->with('success', $this->model . ' Updated Successfully');
        } else {
            return redirect()->back()->with('error', $this->model . 'Nothing to update');
        }
        // $this->validation($request, $gallery->id);
        // $gallery->update($request->all());
        // return redirect()->back()->with('success', $this->model . ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\model\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gallery $gallery)
    {
        $gallery->delete();
        return redirect()->route($this->route . '.index')
            ->with('success', $this->model . ' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.gallery";
        $this->model = "Gallery";
        $this->route = "gallery";
    }

    private function validation($request, $gallery = null)
    {
        $this->validate($request, [
            'name'  => "required|unique:gallerys,name," . $gallery
        ]);
    }

    public function position()
    {
        $galleries = Gallery::orderby('serial', 'ASC')->get();
        return view($this->path . '.position', compact("galleries"));
    }

    public function savePosition(Request $request)
    {

        if (!empty($request->position) && count($request->position) > 0) {
            foreach ($request->position as $id => $position) {

                $gallery = Gallery::where('id', $id)->first();

                $gallery->update([
                    'serial' => $position
                ]);
            }
            return redirect()->back()->with('success', "position updated");
        }
        return redirect()->back()->with('error', "something is wrong");
    }
}
