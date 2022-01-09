<header class="main-header">
    <!-- Logo -->
    <a href="/admin" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>D</b>RTM</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>DRTM</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-expand-md">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle navigation</span> </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav ml-auto">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="nav-item dropdown user user-menu">
                    
                    <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle" aria-expanded="false">
                        
                        @if(!empty(Auth::user()->image))
                        <img class="user-image" src="{{ asset('storage/images/'. Auth::user()->image) }}" alt="User profile picture" />
                        @else
                        <img class="user-image" src="{{asset('admin_assets/lte/dist/img/user1-128x128.jpg.jpg')}}" alt="User profile picture" />
                        @endif 

                        <span class="hidden-xs">{{Auth::user()->name}}</span><i class="fa fa-caret-down" style="margin-left:5px;"></i>
                    </a>

                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">

                            @if(!empty(Auth::user()->image))
                            <img class="img-circle" src="{{ asset('storage/images/'. Auth::user()->image) }}" alt="User profile picture" />
                            @else
                            <img class="img-circle" src="{{asset('admin_assets/lte/dist/img/user1-128x128.jpg.jpg')}}" alt="User profile picture" />
                            @endif

                            <p>{{Auth::user()->name}} <small>{{Auth::user()->role->name}}</small></p>

                        </li>

                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="{{route('admin.profile', Auth::id())}}" class="btn btn-sm btn-success border border-success">
                                    <i class="fa fa-user"></i> Profile
                                </a>
                            </div> 


                            <div class="pull-right">
                                <a href="{{route('admin.logout')}}" class="btn btn-sm btn-danger border border-danger">
                                    <i class="fa fa-sign-out"></i> Sign out
                                </a>
                            </div>
                        
                        </li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </nav>
</header>