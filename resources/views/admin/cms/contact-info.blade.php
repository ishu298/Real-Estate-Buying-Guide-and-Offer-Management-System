@extends('layouts.master')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Contact Infomation Form</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Contact Infomation Form</li>
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
                            <h3 class="card-title">Update Contact Infomation</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{route('admin.store_contact_info')}}" method="POST" enctype="multipart/form-data" class="dropzone"
                            id="my-awesome-dropzone">
                            @csrf
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" 
                                        placeholder="Enter title here" value="{{ json_decode($data->value)->address ?  json_decode($data->value)->address : '' }}">
                                </div>


                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                 value="{{json_decode($data->value)->phone ?  json_decode($data->value)->phone : ''}}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" id="email" name="email"
                                                 value="{{json_decode($data->value)->email ?  json_decode($data->value)->email : ''}}">
                                        </div>
                                    </div>
                                </div>
                                

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="linkedinurl">LinkedIn URL</label>
                                            <input type="text" class="form-control" id="linkedinurl" name="linkedin_url"
                                                 value="{{json_decode($data->value)->linkedin_url ?  json_decode($data->value)->linkedin_url : ''}}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="instaurl">Instagram URL</label>
                                            <input type="text" class="form-control" id="instaurl" name="instagram_url"
                                                 value="{{json_decode($data->value)->instagram_url ?  json_decode($data->value)->instagram_url : ''}}">
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
