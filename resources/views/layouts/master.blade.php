<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Real Estate Buying Guide and Offer Management System
</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
        href="{{ asset('admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/jqvmap/jqvmap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('admin/dist/css/adminlte.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/daterangepicker/daterangepicker.css') }}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/summernote/summernote-bs4.min.css') }}">

    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">

    <!-- Select2 -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">

    <!-- summernote -->
    <link rel="stylesheet" href="{{ asset('admin/plugins/summernote/summernote-bs4.min.css') }}">

    <!-- Theme style -->

</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        @php
            $currentRoute = Route::currentRouteName();
        @endphp
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav" >
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button" onclick="menuFun()" ><i
                            class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="{{ route('dashboard') }}" class="nav-link">Home</a>
                </li>
            </ul>

        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <!-- <a href="{{ route('dashboard') }}" class="brand-link" style="
            background: aliceblue;
        ">
            <img src="{{ asset('frontend/images/logo.svg') }}" alt="Real Estate Buying Guide and Offer Management System
 Logo" class="brand-image "
                    style="opacity: .8;width: 70%;">
                <span class="brand-text font-weight-bold text-dark mx-3"
                    style="
                opacity: 0;
            ">Admin</span>
            </a> -->

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                        <div class="image">
                            <img src="{{ Auth::user()->profile_photo_url }}" class="img-circle elevation-2"
                                alt="User Image">
                        </div>
                        <div class="info">
                            <a href="{{ route('profile.show') }}"
                                class="d-block">{{ ucwords(Auth::user()->name) }}</a>
                        </div>
                    @endif
                </div>

                <!-- SidebarSearch Form -->
                <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                            aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">

                        <li class="nav-item">
                            <a href="{{ route('dashboard') }}" class="nav-link {{ $currentRoute === 'dashboard' ? 'active' : '' }}">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>


                        <li
                            class="nav-item has-treeview menu-item {{ $currentRoute === 'admin.contact_list' || $currentRoute === 'admin.enquire_list' || $currentRoute === 'admin.newsletter' ? 'menu-open' : '' }}">
                            <a href="#"
                                class="nav-link {{ $currentRoute === 'admin.contact_list' || $currentRoute === 'admin.enquire_list' || $currentRoute === 'admin.newsletter' ? 'active' : '' }}">
                                <i class="fas fa-exchange-alt"></i>
                                <p>
                                    Requests
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('admin.contact_list') }}"
                                        class="nav-link {{ $currentRoute === 'admin.contact_list' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Contact Request
                                        </p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ route('admin.enquire_list') }}"
                                        class="nav-link {{ $currentRoute === 'admin.enquire_list' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Enquire Request
                                        </p>
                                    </a>
                                </li>


                            </ul>
                        </li>



                       



                        <li
                            class="nav-item has-treeview menu-item {{ $currentRoute === 'admin.manage_about_us' || $currentRoute === 'admin.manage_contact_info' || $currentRoute === 'admin.manage_privacy_policy' || $currentRoute === 'admin.terms_conditions' ? 'menu-open' : '' }}">
                            <a href="#"
                                class="nav-link {{ $currentRoute === 'admin.manage_about_us' || $currentRoute === 'admin.manage_contact_info' || $currentRoute === 'admin.manage_privacy_policy' || $currentRoute === 'admin.terms_conditions' ? 'active' : '' }}">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>
                                    Manage CMS
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">

                                <li class="nav-item">
                                    <a href="{{ route('admin.manage_about_us') }}"
                                        class="nav-link {{ $currentRoute === 'admin.manage_about_us' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            About-Us
                                        </p>
                                    </a>
                                </li>
                                <!-- <li class="nav-item">
                                    <a href="{{ route('admin.manage_contact_info') }}"
                                        class="nav-link {{ $currentRoute === 'admin.manage_contact_info' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Contact Info
                                        </p>
                                    </a>
                                </li> -->

                                <!-- <li class="nav-item">
                                    <a href="{{ route('admin.manage_privacy_policy') }}"
                                        class="nav-link {{ $currentRoute === 'admin.manage_privacy_policy' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Privacy Policy
                                        </p>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="{{ route('admin.terms_conditions') }}"
                                        class="nav-link {{ $currentRoute === 'admin.terms_conditions' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Terms & Conditions
                                        </p>
                                    </a>
                                </li> -->



                            </ul>
                        </li> 


                        @php
                        $activeRoutes = ['admin.user_list', 'admin.lesson_list', 'admin.property_list', 'admin.manage_email_template'];
                        @endphp
                        <li
                            class="nav-item has-treeview menu-item {{ in_array($currentRoute, $activeRoutes) ? 'active' : '' }}">
                            <a href="#"
                                class="nav-link {{ in_array($currentRoute, $activeRoutes) ? 'active' : '' }}">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Manage
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">

                                <li class="nav-item">
                                    <a href="{{ route('admin.user_list') }}"
                                        class="nav-link {{ $currentRoute === 'admin.user_list' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Users
                                        </p>
                                    </a>
                                </li> 

                                <li class="nav-item">
                                    <a href="{{ route('admin.lesson_list') }}"
                                        class="nav-link {{ $currentRoute === 'admin.lesson_list' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Lessons
                                        </p>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="{{ route('admin.property_list') }}"
                                        class="nav-link {{ $currentRoute === 'admin.property_list' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                           property
                                        </p>
                                    </a>
                                </li>

                                

                                <li class="nav-item">
                                    <a href="{{ route('admin.manage_email_template') }}"
                                        class="nav-link {{ $currentRoute === 'admin.manage_email_template' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Email Templates
                                        </p>
                                    </a>
                                </li>


                            </ul>
                        </li>


                        <li
                            class="nav-item has-treeview menu-item {{ $currentRoute === 'profile.show' || $currentRoute === 'admin.manage_website_setting' || $currentRoute === 'admin.theme_setting' ? 'menu-open' : '' }}">
                            <a href="#"
                                class="nav-link  {{ $currentRoute === 'profile.show' || $currentRoute === 'admin.manage_website_setting'  ? 'active' : '' }}">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>
                                    Setting
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">

                                <li class="nav-item {{  $currentRoute === 'admin.manage_website_setting' ? 'active' : '' }}">
                                    <a href="{{ route('profile.show') }}"
                                        class="nav-link  {{ $currentRoute === 'profile.show' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Profile
                                        </p>
                                    </a>
                                </li>


                                <li class="nav-item">
                                    <a href="{{ route('admin.manage_website_setting') }}"
                                        class="nav-link  {{ $currentRoute === 'admin.manage_website_setting' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Website Setting
                                        </p>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="{{ route('admin.theme_setting') }}"
                                        class="nav-link  {{ $currentRoute === 'admin.theme_setting' ? 'active' : '' }}">
                                        <i class=""></i>
                                        <p>
                                            Theme Setting
                                        </p>
                                    </a>
                                </li>


                            </ul>
                        </li>

                        <li class="nav-item pb-5">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <a href="route('logout')"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();"
                                    class="nav-link">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-log-out">
                                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                        <polyline points="16 17 21 12 16 7"></polyline>
                                        <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg>
                                    <p>Sign Out</p>
                                </a>
                            </form>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            @yield('content')
        </div>
        <!-- /.content-wrapper -->
        @if(request()->is('property/list'))
        <footer class="main-footer" style="position:fixed;  width: 100%; bottom:-50px"  >
            <strong>Copyright &copy; 2023-2024 <a href="#">Real Estate Buying Guide and Offer Management System
</a>.</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                {{-- <b>Version</b> 3.1.0 --}}
            </div>
        </footer>
        @else<footer class="main-footer"  >
            <strong>Copyright &copy; 2023-2024 <a href="#">Real Estate Buying Guide and Offer Management System
</a>.</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                {{-- <b>Version</b> 3.1.0 --}}
            </div>
        </footer>
        @endif

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    {{-- <script src="{{ asset('admin/plugins/jquery/jquery.min.js') }}"></script> --}}
    <!-- jQuery UI 1.11.4 -->
    {{-- <script src="{{ asset('admin/plugins/jquery-ui/jquery-ui.min.js') }}"></script> --}}
    {{-- <script src="{{ asset('admin/dist/js/adminlte.js') }}"></script> --}}
    <script src="https://stageapi.conceptcraft.net/plugins/jquery/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://stageapi.conceptcraft.net/dist/js/adminlte.min.js"></script>



    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="{{ asset('admin/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <!-- ChartJS -->
    <script src="{{ asset('admin/plugins/chart.js/Chart.min.js') }}"></script>
    <!-- Sparkline -->
    <script src="{{ asset('admin/plugins/sparklines/sparkline.js') }}"></script>
    <!-- JQVMap -->
    <script src="{{ asset('admin/plugins/jqvmap/jquery.vmap.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
    <!-- jQuery Knob Chart -->
    <script src="{{ asset('admin/plugins/jquery-knob/jquery.knob.min.js') }}"></script>
    <!-- daterangepicker -->
    <script src="{{ asset('admin/plugins/moment/moment.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/daterangepicker/daterangepicker.js') }}"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="{{ asset('admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
    <!-- Summernote -->
    <script src="{{ asset('admin/plugins/summernote/summernote-bs4.min.js') }}"></script>
    <!-- overlayScrollbars -->
    <script src="{{ asset('admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
    <!-- AdminLTE App -->

    <!-- AdminLTE for demo purposes -->
    <script src="{{ asset('admin/dist/js/demo.js') }}"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="{{ asset('admin/dist/js/pages/dashboard.js') }}"></script>

    <!-- DataTables  & Plugins -->
    <script src="{{ asset('admin/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('admin/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
    <!-- AdminLTE App -->
    {{-- <script src="{{ asset('admin/dist/js/adminlte.min.js') }}"></script> --}}
    <!-- AdminLTE for demo purposes -->
    <script src="{{ asset('admin/dist/js/demo.js') }}"></script>
    <!-- Page specific script -->

    <!-- Summernote -->
    <script src="{{ asset('admin/plugins/summernote/summernote-bs4.min.js') }}"></script>
    <script>
        //    $(document).ready(function() {
        //         $('.menu-item').on('click', function(e) {
        //             $(this).removeClass('menu-is-opening menu-open');
        //         });
        //     });
        $(document).ready(function() {
    $('.nav-item.has-treeview > .nav-link').on('click', function(e) {
        e.preventDefault(); 
        $(this).parent().toggleClass('menu-open'); 
    });

    
    $('.nav-item.has-treeview > .nav-link + ul .nav-link').on('click', function(e) {
        window.location.href = $(this).attr('href');
    });
});
      




       
     

    </script>

    <script>
        $(function() {
            // select2 Purple
            $('.select2').select2()

            // Summernote
            $('.summernote').summernote({
                height: 200, // Adjust height as needed
                width: '100%', // Adjust width as needed
                placeholder:"Place some text here..."
            });

              // Summernote
              $('#summernote').summernote({
                height: 200, // Adjust height as needed
                width: '100%', // Adjust width as needed
                placeholder:"Place some text here..."
            });

              // Summernote
              $('#summernote2').summernote({
                height: 200, // Adjust height as needed
                width: '100%', // Adjust width as needed
                placeholder:"Place some text here..."
            });

            // Datatables
            $("#example1").DataTable({
                "responsive": true,
                "lengthChange": true,
                "autoWidth": false,
                "responsive": true,
                "pageLength":100,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
            $('#example5').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>

    <!-- Select2 -->
    

    <script src="{{ asset('admin/plugins/select2/js/select2.full.min.js') }}"></script>

    <!-- bs-custom-file-input -->
    <script src="{{ asset('admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js') }}"></script>

    <script>
$(function() {
            bsCustomFileInput.init();
        });
        
    </script>


</body>

</html>
