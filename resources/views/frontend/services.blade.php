@extends('frontend.layout.app')
@section('body')
{{-- Content --}}

  <!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Popular Causes</h2>
                <ul>
                    <li> <a href="/"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> About Us</li>
                </ul>
            </div>
        </div>
    </div>

  <!-- ################# Events Start Here#######################--->
<section class="events">
    <div class="container">
        <div class="event-ro row">
            @forelse ($services as $service)
                <div class="col-md-4 col-sm-6">
                    <a href="/donate/{{$service->id}}">
                        <div class="event-box">
                            @if(!empty($service->image))
                            <img class="profile-user-img img-responsive img-circle" src="{{ asset('storage/images/'.$service->image) }}" /></td>
                            @else
                            <img class="profile-user-img img-responsive img-circle" src="{{url('storage/images/user1-128x128.jpg')}}" alt="User profile picture" />
                            @endif

                            <h4>{{$service->title}}</h4>

                            <p class="raises"><span>Raised : ${{App\Model\Service::getAllPayments($service->id)}}</span> / ${{$service->limit}} </p>
                            <p style="color:red;"> {{$service->short_desc}}</p>
                            <p class="desic">{!! $service->description !!}</p>
                            <button class="btn btn-success btn-sm">Donate Now</button>
                        </div>
                    </a>
                </div>
            @empty
                <p>No services yet.</p>
            @endforelse

        </div>
    </div>
</section>
@endsection