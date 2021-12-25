@extends('admin.layouts.layout')
@section('title', 'Add project')

@section('content')

<section class="content">
    <div class="row">

        <div class="col-md-12">

            <div class="box box-success">

                <div class="box-header with-border">
                    <h3 class="box-title">Project Create</h3>
                    <div class="box-tools pull-right">
                        <a href="{{route('project.index')}}" class="btn btn-xs btn-success pull-left text-white router-link-active" title="Add New">
                            <i class="fa fa-arrow-left"></i>
                            <span>Back</span>
                        </a>
                    </div>
                </div>

                <form class="form-row" method="POST" action="{{route('project.store')}}" enctype="multipart/form-data">
                    @csrf

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title<span class="control-label"></span></label>
                            <input type="text" name="title" placeholder="Title" class="form-control" required />
                        </div>  
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Short Description<span class="control-label"></span></label>
                            <input type="text" name="short_desc" placeholder="Short description" class="form-control" required />
                        </div>  
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Description</label>
                            <textarea id="ck-editor" class="form-control" name="description"></textarea>
                        </div>  
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" name="image" class="form-control" id="image">  
                      </div>  
                    </div>

                    {{-- <input type="hidden" name="admin_id" value="{{Auth::user()->id}}" /> --}}

                    <div class="box-footer">
                        <button type="submit" class="btn btn-success pull-right">Submit</button>
                    </div>

                </form>
            </div>

        </div>

    </div>

</section>

@endsection