@extends('admin.layouts.layout')
@section('title', 'List payments')

@push('page-css')
<link rel="stylesheet" href="{{asset('admin_assets/lte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css')}}" />
@endpush

@section('content')

<section class="content">
    <div class="row">
        <div class="col-xs-12">

            <div class="box box-success">

                <div class="box-header with-border">
                    <div class="box-header pull-left">
                        <!-- <span class="box-title">All Roles</span> -->
                    </div>
                </div>

                <!-- /.box-header -->
                <div class="box-body box-min-height">

                    <table class="table table-bordered table-hover table-striped list-data">
                        <thead class="bg-purple text-white">
                            <tr>
                                <th class="serial">#</th>
                                <th>Service Name</th>
                                <th>User</th>
                                <th>Transaction id</th>
                                <th>Mobile</th>
                                <th>Status</th>
                                <th>Created At</th>
                                <th class="action">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @php $count = 0 @endphp
                            @foreach($datas as $data)

                            <tr>
                                <td>{{ $count + $datas->firstItem() }}</td>
                                <td>{{$data->service->title}}</td>
                                <td>{{$data->user->name}}</td>
                                <td>{{$data->tran_id}}</td>
                                <td>{{$data->mobile}}</td>
                                <td>{{$data->status}}</td>
                                <td>{{$data->created_at}}</td>

                                <td>
                                    <a href="{{route('payment.show', $data->id)}}" class="btn btn-xs btn-success action-view" title="View"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>

                            @php $count++ @endphp

                            @endforeach

                        </tbody>

                    </table>
                    <div class="col-md-12">
                        <div class="pull-right">
                            {{$datas->links()}}
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>

@endsection

@push('page-scripts')
<script src="{{asset('admin_assets/lte/bower_components/datatables.net/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('admin_assets/lte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')}}"></script>
@endpush