@extends('layouts.master')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Manage Website</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Manage Website</li>
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
                            <h3 class="card-title">Footer Logo Text</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.update_footer_text') }}" method="POST" enctype="multipart/form-data"
                            class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">


                                    <textarea class="summernote" name="body">
                                                    {{ $data != '' && !empty($data->value) ? $data->value : '' }}
                                         </textarea>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="instaurl">Copyright Text</label>
                                            <input type="text" class="form-control" id="instaurl" name="copyright_text"
                                                value="{{ isset($copyright_text_data->value) ? $copyright_text_data->value : '' }}">
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">About Us</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_about_us') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">


                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">About Us</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $about_data->value }}
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



                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">About Us Image</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_about_us_image') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">


                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">About Us Image</h3>
                                    </div>
                                    @if (!empty($about_us_image->image['path']) && $about_us_image->image['path'] != '')
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="px-4 mt-3">
                                                    <img src="{{ $about_us_image->image['path'] }}" alt=""
                                                        class="w-50">
                                                </div>
                                            </div>
                                        </div>
                                    @endif

                                    <div class="form-group">
                                        <div class="input-group card-body">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="exampleInputFile"
                                                    name="featuredimages">
                                                <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                            </div>
                                            <div class="input-group-append">
                                                <span class="input-group-text">Upload</span>
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



                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Update Contact Infomation</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.store_contact_info') }}" method="POST" enctype="multipart/form-data"
                            class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="address" id="address" class="summernote">{{ isset(json_decode($contact_data->value)->address) ? json_decode($contact_data->value)->address : '' }}</textarea>

                                </div>


                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                value="{{ json_decode($contact_data->value)->phone ? json_decode($contact_data->value)->phone : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" id="email" name="email"
                                                value="{{ json_decode($contact_data->value)->email ? json_decode($contact_data->value)->email : '' }}">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="linkedinurl">LinkedIn URL</label>
                                            <input type="text" class="form-control" id="linkedinurl"
                                                name="linkedin_url"
                                                value="{{ json_decode($contact_data->value)->linkedin_url ? json_decode($contact_data->value)->linkedin_url : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="instaurl">Instagram URL</label>
                                            <input type="text" class="form-control" id="instaurl"
                                                name="instagram_url"
                                                value="{{ json_decode($contact_data->value)->instagram_url ? json_decode($contact_data->value)->instagram_url : '' }}">
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

                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Conatct Page Description</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_contact_description') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $contact_description_data != '' && !empty($contact_description_data->value) ? $contact_description_data->value : '' }}
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Privacy Policy</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_privacy_policy') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $privacy_policy_data != '' && !empty($privacy_policy_data->value) ? $privacy_policy_data->value : '' }}
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Terms Conditions</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_terms_conditions') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $terms_conditions_data != '' && !empty($terms_conditions_data->value) ? $terms_conditions_data->value : '' }}
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Adorn Page Description</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_adorn_description') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $adorn_description_data != '' && !empty($adorn_description_data->value) ? $adorn_description_data->value : '' }}
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Acquire Page Description</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_acquire_description') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $acquire_description_data != '' && !empty($acquire_description_data->value) ? $acquire_description_data->value : '' }}
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


                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Art Page Description</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_art_description') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="body">
                                                    {{ $art_description_data != '' && !empty($art_description_data->value) ? $art_description_data->value : '' }}
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
     
                <div class="col-xl-12 col-lg-12 col-sm-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Art Page - Why do we use it?</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="{{ route('admin.add_n_update_art_wydouse') }}" method="POST"
                            enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone">
                            @csrf
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3 class="card-title fw-bold">Enter Details</h3>
                                    </div>
                                    <textarea class="summernote" name="why_we_use_text">
                                                    {{ $why_we_use_text != '' && !empty($why_we_use_text->value) ? $why_we_use_text->value : '' }}
                                         </textarea>

                                         <div class="shadow p-4">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <h4 class="my-3">Art Video</h4>
                                                        @if(!empty($why_we_use_text_video['name']))
                                                        <video controls width="340" height="200" class="mt-0 pt-0">
                                                            <source src="https://console.danielhanart.com/featured-image/{{$why_we_use_text_video['name']}}" type="video/mp4">
                                                            Your browser does not support the video tag.
                                                          </video>
                                                          @endif

                                                        <div class="input-group">
                                                            <div class="custom-file">
                                                                <input type="file" class="custom-file-input"
                                                                    id="exampleInputvideo" name="artvideo">
                                                                <label class="custom-file-label" for="exampleInputvideo">Choose
                                                                    file</label>
                                                            </div>
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">Upload</span>
                                                            </div>
                                                        </div>
                                                    </div>
        
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
