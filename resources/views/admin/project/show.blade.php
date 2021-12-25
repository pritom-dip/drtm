@extends('admin.layouts.layout')
@section('title', 'Show project')

@section('content')

<section class="content">
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">Project View</h3>
            <div class="box-tools pull-right">
                <a href="{{route('project.index')}}" class="btn btn-xs btn-success pull-left text-white router-link-active" title="Add New"><i class="fa fa-arrow-left"></i> <span>Back</span></a>
            </div>
        </div>
        <div class="box-body box-min-height">
            <table class="table table-bordered table-hover table-striped">
                <tbody>

                    <tr>
                        <th class="text-capitalize">Title</th>
                        <td><span>{{$project->title}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Short Description</th>
                        <td><span>{{$project->short_desc}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Description</th>
                        <td><span>{!! $project->description !!}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Image</th>
                        <td>
                            @if(!empty($project->image))
                            <img class="profile-user-img img-responsive img-circle" src="{{ asset('storage/images/'.$project->image) }}" style="width: 100px; height: 100px;" /></td>
                            @else
                            <img class="profile-user-img img-responsive img-circle" src="{{url('storage/images/user1-128x128.jpg')}}" alt="User profile picture" />
                            @endif
                        </td>
                    </tr>


                </tbody>
            </table>
        </div>
    </div>
    <!---->
</section>


@endsection