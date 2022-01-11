<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">

                @if(!empty(Auth::user()->image))
                <img class="img-circle" src="{{ asset('storage/images/'. Auth::user()->image) }}" alt="User profile picture" />
                @else
                <img class="img-circle" src="{{asset('admin_assets/lte/dist/img/user1-128x128.jpg.jpg')}}" alt="User profile picture" />
                @endif

            </div>
            <div class="pull-left info">
                <p>{{Auth::user()->name}}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
                <a href="/admin" style="display: block;">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>

            <x-sidebarcomponent />

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>