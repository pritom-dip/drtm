@extends('admin.layouts.layout')
@section('title', 'Show Parishad ')

@section('content')

<div class="box box-success">
    <div class="box-header with-border">
        <h3 class="box-title">Staff Memeber View</h3>
        <div class="box-tools pull-right">
            <a href="{{route('staff.index')}}" class="btn btn-xs btn-success pull-left text-white router-link-active" title="Add New"><i class="fa fa-arrow-left"></i> <span>Back</span></a>
        </div>
    </div>
    <div class="container mb-5">
        <div class="row">
          <div class="col-md-12"><label  for="pro_pic"><img id="up_44" width="150px" height="150px" style="cursor: pointer; border: 2px solid #3C8DBC; padding: 4px;" src="{{ asset('storage/'. $staff -> image)}}" width="150px" alt=""></label>
        </div>
        </div>
        <div class="row">
            <div class="col-md-4"><h3>Name: {{ $staff -> name }}</h3></div>
            <div class="col-md-4"></p></div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4>Designation:- {{ $staff -> designation}}</h4></div>
            <div class="col-md-4"><h4>Fathers Name- {{ $staff -> father}} </h4></div>
            <div class="col-md-4"><h4>Office Phone:- {{ $staff -> office_phone}}</h4> </div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4>Joining date:-{{ $staff -> joining_date}}</h4></div>
            <div class="col-md-4"><h4>Mother Name:-{{ $staff -> mother}}</h4>
            </div>
            <div class="col-md-4"><h4>Personal Phone:-{{ $staff -> personal_phone}}</h4> </div>
        </div>
        <div class="row">
            <div class="col-md-4"><h4>Address:-{{ $staff -> address}}</h4></div>
            <div class="col-md-4">
                @php
                    $retVal = (($staff -> marriage_status) == 1) ? "হ্যা" : "না" ;
                @endphp
                <h4> Marriage Status:-{{ $retVal }}</h4>
            @if ($retVal == "হ্যা")
                <P>পুত্র- {{ $staff -> chil_boy }}, কন্যা- {{ $staff -> chil_girl }} </p>
            @endif
            </div>

        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
        </div>
      </div>




    </div>
</div>

@endsection
