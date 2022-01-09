@extends('admin.layouts.layout')
@section('title', 'Accounts Report')

@push('page-css')
<link rel="stylesheet" href="{{ asset('admin_assets') }}/css/bootstrap-datepicker.min.css">
@endpush

@section('content')

<div class="box box-success"  id="print">
    <div class="box-header with-border">
        <h3 class="box-title">Report View</h3>
    </div>

    <div class="mt-2 pr-3" style="width:100%;display:block;text-align:right;">
        <a href="#" onclick="printContent('print')" class="btn btn-sm btn-info printSelected"><i class="fa fa-print"></i> Print</a>
    </div>
    
    <div class="box-body box-min-height reports-wrapper">

        <div style="margin-bottom: 10px;">
            <form method="GET" action="{{route('payment.specific')}}" class="form-inline py-3">
                @csrf
                <select name="service_id" class="form-control">
                    <option value="">Please select</option>
                   @forelse ($services as $service)
                       <option value="{{$service->id}}">{{$service->title}}</option>
                   @empty
                       
                   @endforelse
                </select>

                <select name="date" class="form-control">
                    <option value="">Please select</option>
                    <option value="today">Today</option>
                    <option value="this_week">This Week</option>
                    <option value="this_month">This Month</option>
                    <option value="last_six_month">Last 6 months</option>
                    <option value="this_year">This year</option>
                </select>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <table class="table table-bordered table-hover table-striped list-data">
            <thead class="bg-purple text-white">
                <tr>
                    <th class="serial">#</th>
                    <th>Date</th>
                    <th>Payment Id</th>
                    <th>Payment Type</th>

                    <th>Amount</th>
                    
                </tr>
            </thead>

            <tbody>
                @php 
                $count = 1;
                $total = 0;
                @endphp

                @forelse($payments as $item)
                @php $total += $item->amount @endphp
                <tr>
                    <td>{{ $count }}</td>
                    <td>{{ $item->created_at->format('d M Y') }}</td>
                    <td>{{$item->service->title}}</td>
                    <td>{{$item->user->name}}</td>
                    <td>{{$item->amount}}</td>
                </tr>

                @php $count++ @endphp

                @empty
                <tr>
                    <td colspan="10" align="center">
                        No records available.
                    </td>
                </tr>
                @endforelse
                
            </tbody>

            <tbody>
                <th></th>
                <th></th>
                <th></th>
                <th><strong>Total</strong></th>
                <th><strong>{{number_format($revenuesSum, 2)}}</strong></th>
            </tbody>
            <tbody>
                <th></th>
                <th></th>
                <th></th>
                <th><strong>Grand Total</strong></th>
                <th><strong>{{number_format($revenuesSum,2)}}</strong></th>
            </tbody>

        </table>

        @if(!empty($payments))

        <div class="box-footer clearfix">
            <div class="row mx-0">
                <div class="col-sm-12 col-md-7 p-0 ">
                    <div class="float-right">
                        {{$payments->links()}}
                    </div>
                </div>
            </div>
        </div>

        @endif

    </div>
</div>

@endsection

@push('page-scripts')
<script defer src="{{asset('admin_assets/js/bootstrap-datepicker.min.js')}}"></script>
@endpush