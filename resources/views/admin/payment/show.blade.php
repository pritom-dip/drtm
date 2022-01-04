@extends('admin.layouts.layout')
@section('title', 'Show payment details')

@section('content')

<section class="content">
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">Payment View</h3>
            <div class="box-tools pull-right">
                <a href="{{route('payment.index')}}" class="btn btn-xs btn-success pull-left text-white router-link-active" title="Add New"><i class="fa fa-arrow-left"></i> <span>Back</span></a>
            </div>
        </div>
        <div class="box-body box-min-height">
            <table class="table table-bordered table-hover table-striped">
                <tbody>
                    <tr>
                        <th class="text-capitalize">Service Name</th>
                        <td><span>{{$payment->service->title}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">User</th>
                        <td><span>{{$payment->user->name}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Mobile</th>
                        <td><span>{{$payment->mobile}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Amount</th>
                        <td><span>{{$payment->amount}}</span></td>
                    </tr>

                    <tr>
                        <th class="text-capitalize">Transaction id</th>
                        <td><span>{{$payment->tran_id}}</span></td>
                    </tr>
                    
                    <tr>
                        <th class="text-capitalize">Status</th>
                        <td><span>{{$payment->status}}</span></td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
    <!---->
</section>


@endsection