@extends('admin.layouts.layout')
@section('title', 'Add Staff')

@section('content')

<div class="box box-success">

    <div class="box-header with-border">
        <div class="box-header pull-left">
            <span class="box-title">Add New Staff</span>
        </div>

        @if(App\Model\Permission::roleHasSpecificPermission('staff.index'))

        <div class="box-tools pull-right">
            <a href="{{route('staff.index')}}" class="btn btn-xs btn-success pull-left text-white" title="Add New"><i class="fa fa-arrow-left"></i> <span class="text-capitalize">back</span></a>
        </div>

        @endif

    </div>

    <!-- /.box-header -->
    <div class="box-body box-min-height">
        <div class="row">
            <form class="form-row col-md-12" method="POST" action="{{route('staff.update',$staff -> id)}}" enctype="multipart/form-data">

                @csrf
                @method('PUT')

                <div class="col-md-12 pt-4">
                    <div class="row p-2 pb-4">
                        <!------------ Single Input ------------>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Name</label>
                                <input value="{{ $staff -> name }}" type="text" name="staff[name]" class="form-control" required/>
                            </div>
                        </div>

                        <!------------ Single Input ------------>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Fathers Name</label>
                                <input value="{{ $staff -> father}}" type="text" name="staff[father]" class="form-control" />
                            </div>
                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Office Phone</label>
                                <input value="{{ $staff -> office_phone}}" type="text" name="staff[office_phone]" class="form-control" />
                            </div>
                        </div>

                        <!------------ Single Input ------------>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Designation</label>
                                <input value="{{ $staff -> designation}}" type="text" name="staff[designation]" class="form-control" />
                            </div>
                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Joining date</label>
                                <input value="{{ $staff -> joining_date}}" type="text" name="staff[joining_date]" class="form-control" />
                            </div>
                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Mother Name</label>
                                <input value="{{ $staff -> mother}}" type="text" name="staff[mother]" class="form-control" />
                            </div>
                        </div>

                        <!------------ Single Input ------------>
                        <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Personal Phone</label>
                            <input value="{{ $staff -> personal_phone}}" type="text" name="staff[personal_phone]" class="form-control" />
                        </div>
                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-2">
                            @php
                                $yes = "";
                                $no = "";

                                if(($staff -> marriage_status) == 1){
                                    $yes = "selected";
                                }else{
                                    $no = "selected";
                                }
                            @endphp
                            <label class="control-label">Marriage Status</label>
                            <select name="staff[marriage_status]" class="form-control">

                                <option value="1" {{ $yes }}>Yes</option>
                                <option value="0" {{ $no }}>No</option>
                            </select>

                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-1">
                            <div class="form-group">
                                <label class="control-label">Number of Boy</label>
                                <input value="{{ $staff -> chil_boy}}" type="number" name="staff[chil_boy]" class="form-control" />
                            </div>
                        </div>
                        <!------------ Single Input ------------>
                        <div class="col-md-1">
                            <div class="form-group">
                                <label class="control-label">Number of Girl</label>
                                <input value="{{ $staff -> chil_girl}}" type="number" name="staff[chil_girl]" class="form-control" />
                            </div>
                        </div>

                        <!------------ Single Input ------------>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label">Address</label>
                                <input value="{{ $staff -> address}}" type="text" name="staff[address]" class="form-control" />
                            </div>
                        </div>

                        <!------------ Single Input ------------>
                        <div class="col-md-2 mb-5">
                            <label  for="pro_pic"><img id="up_44" width="150px" height="150px" style="cursor: pointer; border: 2px solid #3C8DBC; padding: 4px;" src="{{ asset('storage/'. $staff -> image)}}" width="150px" alt=""></label>
                            <input name="image" id="pro_pic" class="upload_image" code="up_44"  type="file" >
                            <br>
                            <br>


                        </div>

                    </div>

                </div>

                <!-------------- button -------------->
                <div class="col-12 mb-3 mt-4">
                    <button type="submit" class="btn btn-sm btn-info">Update</button>
                </div>
                <!-------------- button -------------->
            </form>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.box-body -->
</div>

@endsection
