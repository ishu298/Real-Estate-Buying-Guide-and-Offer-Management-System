@extends('layouts.master')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Terms Conditions Form</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Terms Conditions Form</li>
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
                            <h3 class="card-title">Terms Conditions</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_terms_conditions') }}" method="POST" enctype="multipart/form-data"
                            class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea id="summernote" name="body">
                                                    {{$data != "" && !empty($data->value) ? $data->value : ''}}
                                         </textarea>
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
