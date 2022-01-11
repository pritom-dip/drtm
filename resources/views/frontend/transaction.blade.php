@extends('frontend.layout.app')
@section('body')
{{-- Content --}}


  <!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Transactions</h2>
                <ul>
                    <li> <a href="/"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Transactions</li>
                </ul>
            </div>
        </div>
    </div>


    <div class="row contact-rooo no-margin">
        <div class="container">
            <div class="content">

                <table class="table table-hover product_item_list c_table theme-color mb-0">
                                <thead>
                                    <tr>

                                        <th data-breakpoints="sm xs"> Name</th>
                                        <th data-breakpoints="sm xs"> Service</th>
                                        <th data-breakpoints="xs">Email</th>
                                        <th data-breakpoints="xs md">Mobile Number</th>
                                        <th data-breakpoints="sm xs md">Amount</th>
                                        <th data-breakpoints="sm xs md">Message</th>
                                        <th data-breakpoints="sm xs md">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  @forelse ($transactions as $transaction)
                                      <tr>
                                        <td>{{Auth::user()->name}}
                                        </td>

                                        <td>{{$transaction->service->title}}
                                        </td>

                                        <td>
                                            {{Auth::user()->email}}
                                        </td>

                                        <td>
                                            {{$transaction->mobile}}
                                        </td>

                                        <td>
                                            {{$transaction->amount}}
                                        </td>

                                        <td>
                                            {{$transaction->message}}
                                        </td>
                                        
                                        <td>
                                          <a href="tel:" class=" btn-sm btn-primary">Make a call 01720972180</a>

                                        </td>
                                    </tr>
                                  @empty
                                    <p>No Transaction yet.
                                  @endforelse  

                                </tbody>
                            </table>

            </div>
        </div>

    </div>


@endsection