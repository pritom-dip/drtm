<table class="table table-bordered table-hover table-striped list-data">
    <thead class="bg-purple text-white">
        <tr>
            <th class="serial">#</th>
            <th>Date</th>
            <th>Payment Id</th>
            <th>Payment Type</th>
            <th>Student ID</th>
            <th>Class</th>
            <th>Section</th>
            <th>shift</th>
            <th>Account Head Name</th>
            <th>Amount</th>
            
        </tr>
    </thead>

    <tbody>
        @php 
        $count = 1;
        $total = 0;
        @endphp

        @forelse($ladgerReports as $item)
        @php $total += $item->amount @endphp
        <tr>
            <td>{{ $count }}</td>
            <td>{{ $item->created_at->format('d M Y') }}</td>
            <td>{{$item->paymentId}}</td>
            <td>{{$item->payment_type}}</td>
            <td>{{$item->student->studentID}}</td>
            <td>{{$item->student->class->name}}</td>
            <td>{{$item->student->section->name}}</td>
            <td>{{$item->student->shift}}</td>
            <td>{{$item->accountHead->name}}</td> 
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
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th><strong>Total</strong></th>
        <th><strong>{{number_format($total, 2)}}</strong></th>
    </tbody>
    <tbody>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th><strong>Grand Total</strong></th>
        <th><strong>{{number_format($sum,2)}}</strong></th>
    </tbody>

</table>

@if(!empty($ladgerReports))

<div class="box-footer clearfix">
    <div class="row mx-0">
        <div class="col-sm-12 col-md-7 p-0 ">
            <div class="float-right">
                {{$ladgerReports->links()}}
            </div>
        </div>
    </div>
</div>

@endif