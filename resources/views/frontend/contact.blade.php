@extends('frontend.layout.app')
@section('body')
{{-- Content --}}


  <!--  ************************* Page Title Starts Here ************************** -->

    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Contact Us</h2>
                <ul>
                    <li> <a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Contact US</li>
                </ul>
            </div>
        </div>
    </div>



  <!--  ************************* Contact Us Starts Here ************************** -->


    <div style="margin-top:0px;" class="row no-margin">

        <iframe style="width:100%" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14586.446825008034!2d88.99402136947273!3d23.93880011393!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39febb38f4472e97%3A0x7e2cb796535e7dda!2sMirpur!5e0!3m2!1sen!2sbd!4v1630309989136!5m2!1sen!2sbd"  height="450" frameborder="0" style="border:0" allowfullscreen></iframe>


    </div>

    <div class="row contact-rooo no-margin">
        <div class="container">
            <div class="content">

              <form id="information_form" method="POST" action="https://drtmfoundation.org/post/information">
                <input type="hidden" name="_token" value="dTy3qtVIJbct7bCn1lsPWyzs5naZZ4OM22w1LKh1">                <div style="padding:20px" class="col-sm-7">
                    <h2 >Contact Form</h2> <br>
                    <div class="row cont-row">
                        <div  class="col-sm-3"><label>Enter Name </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" placeholder="Enter Name" name="name" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>Email Address </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="email" placeholder="Enter Email Address" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>Mobile Number</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="mobile" placeholder="Enter Mobile Number" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>Enter Message</label><span>:</span></div>
                        <div class="col-sm-8">
                            <textarea rows="5" name="message" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
                        </div>
                    </div>
                    <div style="margin-top:10px;" class="row">
                        <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                        <div class="col-sm-8">
                            <button class="btn btn-primary btn-sm"  id="btn-submit" type="submit">Send Message</button>
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
                      <a href="tel:+880 1713482773">Phone:+880 1713482773</a><br>
                      Email: info@drdmfoundation.com<br>
                      Website:https://drtmfoundation.org/<br>

                    </div>


                </div>

            </div>
        </div>

    </div>


@endsection