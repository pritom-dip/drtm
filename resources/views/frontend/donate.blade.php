@extends('frontend.layout.app')
@section('body')
{{-- Content --}}

<!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Donate</h2>
                <ul>
                    <li> <a href="/"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Donate</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row contact-rooo no-margin">
        <div class="container">
            <div class="content mt-4">

                @if(Session::has('success'))
                <p class="alert alert-success">{{ Session::get('success') }}</p>
                @endif

                @if(Session::has('error'))
                <p class="alert alert-danger">{{ Session::get('error') }}</p>
                @endif

                @if($errors->any())
                    <div class="alert alert-danger">
                        <p><strong>Opps Something went wrong</strong></p>
                        <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                        </ul>
                    </div>
                @endif

              <form id="drequest_form" method="POST" action="/donate/{{$service->id}}">
                @csrf
                    <h2>Donate Form</h2> <br>

                    <div class="row cont-row">
                        <div class="col-sm-3"><label>Service</label><span>:</span></div>
                        <div class="col-sm-8">
                            <select type="text" name="service_id" class="form-control input-sm">
                                <option value="">Please select</option>
                                @forelse ($services as $single_service)
                                    <option <?php if($single_service->id == $service->id) echo 'selected'; ?> value="{{$single_service->id}}">{{$single_service->title}}</option>
                                @empty
                                    
                                @endforelse
                            </select>
                        </div>
                    </div>
                    
                    <div class="row cont-row">
                        <div class="col-sm-3"><label>Mobile Number</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="mobile" placeholder="Enter Mobile Number" class="form-control input-sm"></div>
                    </div>
                    <div class="row cont-row">
                        <div class="col-sm-3"><label>You Want to Pay</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="amount" placeholder="Enter Your Amount" class="form-control input-sm"></div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3"><label>Enter Message</label><span>:</span></div>
                        <div class="col-sm-8">
                            <textarea rows="5" name="message" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
                        </div>
                    </div>
                    <div style="margin-top:10px;" class="row">
                        <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                        <div class="col-sm-8">
                            <button class="btn btn-primary btn-sm" id="btn-submit" type="submit">Send Message</button>
                        </div>
                    </div>

                </div>
              </form>
                <div class="col-sm-5">

                    <div style="margin:50px" class="serv">

                        <h2 style="margin-top:10px;">Address</h2>

                        Village: Putimari, <br>
                        Post office: Kursha,<br>
                        Union: Kursha,<br>
                        Thana: Mirpur,<br>
                        District: Kushtia, Bangladesh. <br>
                        Phone:+880 1713482773<br>
                        Email: <a href="mailto:info@drtmfoundation.com" class="">info@drtmfoundation.com</a><br>
                        Web: <a href="http://drtmfoundation.org/" class="">https://drtmfoundation.org</a>

                    </div>

                </div>

            </div>
        </div>

    </div>

@endsection
