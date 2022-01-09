<div class="row mt-5">
    <div class="col-6">
        <div class="revenue-wrapper">
            <h6 class="text-center text-light bg-dark m-0 p-2">Revenue Receipt</h6>
            <table class="table table-bordered table-hover table-striped list-data">
                <thead>
                    <th>SN</th>
                    <th>Account Title</th>
                    <th>Amount</th>
                </thead>
                <tbody>
                    @php $count=1 @endphp
                    @forelse ($groupByRevenues as $key => $item)
                        <tr>
                            <td>{{$count++}}</td>
                            <td>{{App\Model\AccountHead::getAccountHeadNameViaId($key)}}</td>
                            <td>{{number_format($item->sum('amount'), 2)}}</td>
                        </tr> 
                    @empty
                        
                    @endforelse

                    @forelse ($incomes as $item)
                        <td>{{$count++}}</td>
                        <td>{{$item->accountHead->name ?? ''}}</td>
                        <td>{{number_format($item->sum('amount'), 2)}}</td>
                    @empty
                    @endforelse

                    <tr>
                        <td></td>
                        <td><strong>Grand Total</strong></td>
                        <td><strong>{{number_format($sum, 2)}}</strong></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-6">
        <div class="revenue-wrapper">
            <h6 class="text-center text-light bg-dark m-0 p-2">Payments Receipt</h6>
            <table class="table table-bordered table-hover table-striped list-data">
                <thead>
                    <th>SN</th>
                    <th>Account Title</th>
                    <th>Amount</th>
                </thead>
                <tbody>
                    @php $i = 1 @endphp
                    @forelse ($payments as $expense)
                        <tr>
                            <td>{{$i++}}</td>
                            <td>{{$expense->name}}</td>
                            <td>{{number_format($expense->amount, 2)}}</td>
                        </tr>
                    @empty
                        
                    @endforelse

                    <tr>
                        <td></td>
                        <td><strong>Grand Total</strong></td>
                        <td><strong>{{number_format($paymentsSum, 2)}}</strong></td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>

    <div class="col-6 offset-3 text-center mt-3 mb-5">
        <h6 class="text-center text-light bg-dark m-0 p-2">Receipts over payments</h6>
        <table class="table table-bordered table-hover table-striped list-data">
            <tbody>
                <tr>
                    <td>Total Receipts</td>
                    <td>{{number_format($sum, 2)}}</td>
                </tr>
                <tr>
                    <td>Total Payments</td>
                    <td>{{number_format($paymentsSum, 2)}}</td>
                </tr>
                <tr>
                    <td><strong> Net surplus/ (Deficit)<strong></td>
                    <td><strong>{{number_format(($sum-$paymentsSum), 2)}}<strong></td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>