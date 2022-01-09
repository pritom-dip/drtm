@extends('admin.layouts.layout')
@section('title', 'Dashboard')
@section('content')

@push('page-css')
@endpush




@section('content')

<section class="content">
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Admin</h3>           
        </div>
        <div class="box-body">
            <!-- Info boxes -->
            <div class="row">
                @include('admin.dashboard.partials.statistic')
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- TABLE: LATEST ORDERS -->
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">Revenue CHART</h3>
                        </div>
                        <div class="box-body">
                            @include('admin.dashboard.partials.pie')
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </div>        
    </div>
</section>

@endsection

@push('page-scripts')
@endpush

@endsection