<header class="continer-fluid">
        <div class="header-top">
            <div class="container">
                <div class="row col-det">
                    <div class="col-lg-6 d-none d-lg-block">
                        <ul class="ulleft">
                            <li>
                                <i class="far fa-envelope"></i>
                                <a href="mailto:info@drtmfoundation.com" class="">info@drtmfoundation.com</a>
                                <span>|</span>
                            </li>
                            <li>
                                <i class="fas fa-phone-volume"></i>
                                <a href="tel:+880 1713482773" class="">+880 1712345567</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 folouws">
                        <ul class="ulright">
                            <li><small>Follow Us </small>:</li>
                            <li>
                                <a
                                    href="https://www.facebook.com/Dr-Tanjilar-Rahaman-Meherunnesa-Foundation-209750637729273"
                                >
                                    <i class="fab fa-facebook-square"></i
                                ></a>
                            </li>
                            <li>
                                <i class="fab fa-twitter-square"></i>
                            </li>
                            <li>
                                <i class="fab fa-instagram"></i>
                            </li>
                            <li>
                                <i class="fab fa-linkedin"></i>
                            </li>
                        </ul>
                    </div>
                    <!--<ul class="navbar-nav ml-auto">-->
                    <!-- Authentication Links -->
                    <li class="nav-item">
                        <a class="nav-link" href="view/request/donate.html">
                            <button class="btn btn-sm btn-success">Donate Request</button>
                        </a>
                    </li>
                    <li class="nav-item">
                        @if (Auth::check())
                            <div class="info">
                            <a class="nav-link">{{ Auth::user()->name ?? ""}}</a>
                            </div>
                        @else
                            <a class="nav-link" href="dashboard/login.html"
                                ><button class="btn btn-sm btn-success">Login</button></a
                            >
                        @endif
                        
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="dashboard/register.html"></a>
                    </li>

                    <!--</ul>-->
                </div>
            </div>
        </div>

        <div id="menu-jk" class="header-bottom">
            <div class="container">
                <div class="row nav-row">
                    <div class="col-lg-3 col-md-12 logo">
                        <a href="index.html">
                            <img src="Dashboard/assets/images/logo.jpg" width="130px" height="auto" alt="" />
                            <a data-toggle="collapse" data-target="#menu" href="#menu"
                                ><i class="fas d-block d-lg-none small-menu fa-bars"></i
                            ></a>
                        </a>
                    </div>
                    <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
                        <ul class="navbad">
                            <li class="nav-item active">
                                <a class="nav-link" href="index-2.html">Home </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="aboutus.html">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="service.html">Services</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="gallery.html">Gallery</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="blog.html">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Contact US</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
