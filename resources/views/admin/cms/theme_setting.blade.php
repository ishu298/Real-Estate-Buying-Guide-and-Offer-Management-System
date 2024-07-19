@extends('layouts.master')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Theme Setting</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Theme Setting</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Home Page</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.update_theme_setting') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">


                                <!-- /.card-header -->
                                <div class="card-body">
                                    
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="card-header">
                                                <h3 class="card-title fw-bold">Home Category Background Color</h3>
                                            </div>

                                            <div class="form-group mt-3 pb-0 mb-1">
                                                <input type="color" name="category_bg_color" class="form-control" id="cbgcolor" value="{{$home_category_color->value}}">
                                            </div>
                                            <small class="text-dark mx-1">Click on the color box to choose your preferred color.</small>
                                        </div>
     
                                        <div class="col-lg-6">
                                            <div class="card-header">
                                                <h3 class="card-title fw-bold"> Newsletter Background Color</h3>
                                            </div>
                                            <div class="form-group my-3">
                                                <input type="color" name="newsletter_bg_color" value="{{$home_newsletter_color->value}}" class="form-control" id="cbgcolor"
                                                 >
                                            </div>
                                        </div>
                                    </div>
                                
                                </div>


                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $('#postTitleInput').keyup(function() {
            var replaceSpace = $(this).val();
            var result = replaceSpace.replace(/\s/g, "-").toLowerCase();
            $("#postSlugInput").val(result);
        });
    </script>
@endsection
