@extends('frontend.layout.app')
@section('body')
{{-- Content --}}

<!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Become a blood donator</h2>
                <ul>
                    <li> <a href="/"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i>Blood Donate Form</li>
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

              <form id="drequest_form" method="POST" action="/blood-donator">
                @csrf
                    <h2>Blood Donate Form</h2> <br>
                    
                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Name</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="name" placeholder="Name" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Age</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="age" placeholder="Age" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3"><label>Blood Group</label><span>:</span></div>
                        <div class="col-sm-8">
                            <select type="text" name="blood_group" class="form-control input-sm">
                                <option value="">Please select</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="A-">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3"><label>Gender</label><span>:</span></div>
                        <div class="col-sm-8">
                            <select type="text" name="gender" class="form-control input-sm">
                                <option value="">Please select</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Mobile</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="mobile" placeholder="Mobile" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Height</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="height" placeholder="Height" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Weight</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="weight" placeholder="Weight" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>Address</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="address" placeholder="Address" class="form-control input-sm">
                        </div>
                    </div>

                    <div class="row cont-row">
                        <div class="col-sm-3">
                            <label>City</label><span>:</span>
                        </div>
                        <div class="col-sm-8">
                            <input type="text" name="city" placeholder="City" class="form-control input-sm">
                        </div>
                    </div>

                    <div style="margin-top:10px;" class="row">
                        <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                        <div class="col-sm-8">
                            <button class="btn btn-primary btn-sm" id="btn-submit" type="submit">Submit</button>
                        </div>
                    </div>

                </div>
              </form>
            </div>
        </div>

    </div>

@endsection
