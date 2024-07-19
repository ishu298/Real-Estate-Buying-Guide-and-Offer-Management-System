@extends('layouts.master')

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>{{isset($lesson) ? 'Edit' : 'Add' }} Lesson</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">{{isset($lesson) ? 'Edit' : 'Add' }} Lesson</li>
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
                            <h3 class="card-title">Enter Lesson Details</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.lesson_store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body">
                            <div class="form-group">
                                    <input type="hidden" id="id" name="id" class="form-control" value="{{isset($lesson) ? $lesson->id : '' }}" >
                                </div>
                           
                            <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($lesson) ? $lesson->title : '') }}" required>
                                    @error('title')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                  

                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <textarea id="description" name="description" class="form-control" rows="3">{{ old('description', isset($lesson) ? $lesson->description : '') }}</textarea>
                                    @error('description')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="video">Video File (MP4 format)</label>
                                    <input type="file" id="video" name="video_url" class="form-control-file" >
                                    @if(isset($lesson) && $lesson->video_url)
                                        <small>Current Video: <a href="{{ $lesson->video_url }}" target="_blank">View</a></small>
                                    @endif
                                    @error('video_url')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="thumbnail">Thumbnail (optional)</label>
                                    <input type="file" id="thumbnail" name="thumbnail_url" class="form-control-file" accept="image/*">
                                    @if(isset($lesson) && $lesson->thumbnail_url)
                                        <small>Current Thumbnail: <a href="{{ $lesson->thumbnail_url }}" target="_blank">View</a></small>
                                    @endif
                                    @error('thumbnail_url')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-success" id="submitbtn">Submit</button>
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
        // $('#password_confirmation').keyup(function() {
        //     var passwordConfirmation = $(this).val();
        //     var password = $('#password').val();
        //     var confirmPasswordMsg = $('#comfirm_pass_msg');
        //     confirmPasswordMsg.removeClass('d-none').text(password !== passwordConfirmation ? 'Password Not Matched' : 'Password Matched');
        //     confirmPasswordMsg.toggleClass('text-danger', password !== passwordConfirmation);
        //     confirmPasswordMsg.toggleClass('text-success', password === passwordConfirmation);

        //     $('#submitbtn').prop('disabled', password !== passwordConfirmation);
        // });
    </script>
@endsection
