@extends('frontend.layout.app')
@section('body')
{{-- Content --}}


  <!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Contact Us</h2>
                <ul>
                    <li> <a href="/"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i>Blood Donator</li>
                </ul>
            </div>
        </div>
    </div>



  <!--  ************************* Donator list Starts Here ************************** -->



    <div class="row contact-rooo no-margin">
        <div class="container">
            <div class="content">

                @forelse ($groupByDonators as $key => $donators)
                    
                    <h3 class="m-4">{{$key}} Blood donors List : </h3>   

                    <table class="table table-hover product_item_list c_table theme-color mb-0">
                        <thead>
                            <tr>

                                <th data-breakpoints="sm xs"> Name</th>
                                <th data-breakpoints="sm xs"> Age</th>
                                <th data-breakpoints="xs">Gender</th>
                                <th data-breakpoints="xs md">Mobile</th>
                                <th data-breakpoints="sm xs md">Height</th>
                                <th data-breakpoints="sm xs md">Weight</th>
                                <th data-breakpoints="sm xs md">Address</th>
                                <th data-breakpoints="sm xs md">City</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($donators as $donator)
                                <tr>
                                <td>{{$donator->name}}
                                </td>

                                <td>
                                    {{$donator->age}}
                                </td>

                                <td>
                                    {{$donator->gender}}
                                </td>

                                <td>
                                    {{$donator->mobile}}
                                </td>

                                <td>
                                    {{$donator->height}}
                                </td>

                                <td>
                                    {{$donator->weight}}
                                </td>

                                <td>
                                    {{$donator->address}}
                                </td>

                                <td>
                                    {{$donator->city}}
                                </td>
                            
                            </tr>
                            @empty
                            <p>No Donators yet.
                            @endforelse  

                        </tbody>
                    </table>

                @empty
                    <p>No donators yet.</p>
                @endforelse


            </div>
        </div>

    </div>


@endsection