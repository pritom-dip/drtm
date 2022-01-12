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

                <div class="col-lg-6 col-md-9 folouws">
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

                    <ul class=" ml-auto d-flex">
                    <li class="nav-item">
                        <a class="nav-link" href="/donate/1">
                            <button class="btn btn-sm btn-success">Donate</button>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/blood-donator">
                            <button class="btn btn-sm btn-success">Blood Donator Form</button>
                        </a>
                    </li>

                    <li class="nav-item">
                        @if (Auth::check())
                            <div class="info">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        {{ Auth::user()->name ?? ""}}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="{{ route('logout') }}"  onclick="event.preventDefault();
                                                            document.getElementById('logout-form').submit();">Logout</a>

                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        </div>

                                        <a class="dropdown-item" href="/transactions">Transaction</a>
                                    </div>
                                </div>
                            </div>
                        @else
                            <a class="nav-link" href="/login"
                                ><button class="btn btn-sm btn-success">Login</button></a
                            >
                        @endif
                        
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/register"></a>
                    </li>

                </ul>


                </div>
                
            </div>
        </div>
    </div>

    <div id="menu-jk" class="header-bottom">
        <div class="container">
            <div class="row nav-row align-items-center">
                <div class="col-lg-3 col-md-12 logo">
                    <a href="/">
                        <img src="Dashboard/assets/images/logo.jpg" width="130px" height="auto" alt="" />
                        <a data-toggle="collapse" data-target="#menu" href="#menu"
                            ><i class="fas d-block d-lg-none small-menu fa-bars"></i
                        ></a>
                    </a>
                </div>
                <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
                    <ul class="navbad">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/about">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/services">Services</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/gallery">Gallery</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/blood-donator-list">Donator List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contact">Contact US</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
