@extends('layouts.master')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Email Template Form</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Email Template Form</li>
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
                        <h3 class="card-title">Edit Email Template</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="{{route('admin.update_email_template')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input name="id" type="hidden" class="form-control" id="id" value="{{$templates['id']}}">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Template Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" name="name" value="{{$templates['name']}}" required>
                            </div>

                            <div class="form-group">
                                <label for="email_subject">Email Subject</label>
                                <input type="text" class="form-control" id="email_subject" name="subject" value="{{$templates['subject']}}" required>
                            </div>


                            

                            <div class="form-group">
                                  <!-- /.card-header -->
                                  <div class="card-body">
                                    <textarea id="summernote" name="template">
                                           {{$templates['template']}}
                                     </textarea>
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

@endsection