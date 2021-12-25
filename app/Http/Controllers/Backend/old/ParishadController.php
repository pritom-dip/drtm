<?php

namespace App\Http\Controllers\Backend;

use App\Model\Parishad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ParishadController extends Controller
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
        $query  = Parishad::latest()->where('status', 'a');

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
        $this->validation($request);

        $data = $request->input('parishad');

        //Save feature image
        if (!empty($request->file('image'))) {
            $data['image'] = Storage::putFile('upload/parishad', $request->file('image'));
        }

        Parishad::create($data);

        return redirect()->route($this->route . '.index')
            ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Parishad  $parishad
     * @return \Illuminate\Http\Response
     */
    public function show(Parishad $parishad)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path . '.show', compact("parishad", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Parishad  $parishad
     * @return \Illuminate\Http\Response
     */
    public function edit(Parishad $parishad)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view(
            $this->path . '.edit',
            compact("parishad", "breadcumbs")
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Parishad  $parishad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Parishad $parishad)
    {
        $this->validation($request, $parishad->id);
        $data = $request->input('parishad');

        //Save feature image
        if (!empty($request->file('image'))) {
            $deleteImage  = $this->deleteOldImage($parishad);
            $data['image'] = Storage::putFile('upload/parishad', $request->file('image'));
        }

        $parishad->update($data);
        return redirect()->back()->with('success', $this->model . ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Parishad  $parishad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Parishad $parishad)
    {
        $parishad->update(['status' => 'd']);
        return redirect()->route($this->route . '.index')
            ->with('success', $this->model . ' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.parishad";
        $this->model = "Parishad";
        $this->route = "parishad";
    }

    private function validation($request, $parishad = null)
    {
        $this->validate($request, [
            'parishad.name'  => "required|unique:parishads,name," . $parishad
        ]);
    }

    private function deleteOldImage($parishad)
    {
        if ($parishad->image) {
            Storage::delete('/public/parishad/' . $parishad->image);
            return true;
        }
        return false;
    }

    public function position()
    {
        $parishads = Parishad::orderby('serial', 'ASC')->get();
        return view($this->path . '.position', compact("parishads"));
    }

    public function savePosition(Request $request)
    {
        if (!empty($request->position) && count($request->position) > 0) {
            foreach ($request->position as $id => $position) {

                $parishad = Parishad::where('id', $id)->first();

                $parishad->update([
                    'serial' => $position
                ]);
            }
            return redirect()->back()->with('success', "Parishad updated");
        }
        return redirect()->back()->with('error', "something is wrong");
    }
}
