<?php

namespace App\Http\Controllers\Backend;

use App\Model\Staff;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
    /*use App\Http\Controllers\Controller*/;

class StaffController extends Controller
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
        $query  = Staff::latest()->where('status', 'a');

        if (!empty($request->field_name) && !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }

        $breadcumbs = $this->breadcumbs($this->model, 'index');
        $staffs      = $query->paginate(10);

        return view($this->path . '.index', compact('staffs', 'breadcumbs'));
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
        $data = $request->input('staff');

        if (!empty($request->file('image'))) {
            $data['image'] = Storage::putFile('upload/staff', $request->file('image'));
        }
        // $this->validation($request);
        Staff::create($data);

        return redirect()->route($this->route . '.index')
            ->with('success', $this->model . ' successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function show(Staff $staff)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'show');

        return view($this->path . '.show', compact("staff", "breadcumbs"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function edit(Staff $staff)
    {
        $breadcumbs = $this->breadcumbs($this->model, 'edit');
        return view(
            $this->path . '.edit',
            compact("staff", "breadcumbs")
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Staff $staff)
    {
        $data = $request->input('staff');
        if (!empty($request->file('image'))) {
            $deleteImage  = $this->deleteOldImage($staff);
            $data['image'] = Storage::putFile('upload/staff', $request->file('image'));
        }
        //$this->validation($request, $staff->id);
        $staff->update($data);
        return redirect()->back()->with('success', $this->model . ' Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function destroy(Staff $staff)
    {
        $staff->update(['status' => 'd']);
        return redirect()->route($this->route . '.index')
            ->with('success', $this->model . ' deleted');
    }

    public function __construct()
    {
        $this->path  = "admin.staff";
        $this->model = "Staff";
        $this->route = "staff";
    }

    private function validation($request, $staff = null)
    {
        $this->validate($request, [
            'staff.name'  => "required:staffs,name," . $staff
        ]);
    }
    private function deleteOldImage($staff)
    {
        if ($staff->image) {
            Storage::delete('/public/parishad/' . $staff->image);
            return true;
        }
        return false;
    }

    public function position()
    {
        $staffs = Staff::orderby('serial', 'ASC')->get();
        return view($this->path . '.position', compact("staffs"));
    }

    public function savePosition(Request $request)
    {
        if (!empty($request->position) && count($request->position) > 0) {
            foreach ($request->position as $id => $position) {

                $staff = Staff::where('id', $id)->first();

                $staff->update([
                    'serial' => $position
                ]);
            }
            return redirect()->back()->with('success', "Staff updated");
        }
        return redirect()->back()->with('error', "something is wrong");
    }
}
