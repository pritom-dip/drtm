@extends('admin.layouts.layout')
@section('title', 'Edit team')

@section('content')

<section class="content">
    <div class="row">

        <div class="col-md-12">

            <div class="box box-success">

                <div class="box-header with-border">
                    <h3 class="box-title">Team Edit</h3>
                    <div class="box-tools pull-right">
                        <a href="{{route('team.index')}}" class="btn btn-xs btn-success pull-left text-white router-link-active" title="Add New">
                            <i class="fa fa-arrow-left"></i>
                            <span>Back</span>
                        </a>
                    </div>
                </div>

                <form class="form-row" method="POST" action="{{route('team.update', $team->id)}}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title<span class="control-label"></span></label>
                            <input type="text" value="{{$team->title}}" name="title" placeholder="Title" class="form-control" required />
                        </div>  
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Designation<span class="control-label"></span></label>
                            <input type="text" value="{{$team->designation}}" name="designation" placeholder="Short description" class="form-control" required />
                        </div>  
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" name="image" class="form-control" id="image">
                        </div>  
                    </div>

                    <div class="box-footer">
                        <button type="submit" class="btn btn-success pull-right">Submit</button>
                    </div>

                </form>
            </div>

        </div>

    </div>

</section>

@endsection