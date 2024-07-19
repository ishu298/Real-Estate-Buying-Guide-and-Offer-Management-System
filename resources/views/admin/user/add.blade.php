@extends('layouts.master')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Add User</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Add User</li>
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
                            <h3 class="card-title">Enter User Details</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="store" method="POST" enctype="multipart/form-data" class="dropzone"
                            id="my-awesome-dropzone">
                            @csrf
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required
                                        placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required
                                        placeholder="Enter Email">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" minlength="8" required autocomplete="new-password" 
                                        placeholder="Enter Password">
                                </div>

                                <div class="form-group">
                                    <label for="password_confirmation">Confirm Password</label>
                                    <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" required minlength="8" 
                                        placeholder="Enter Confirmation Password">
                                        <small id="comfirm_pass_msg" class="text-danger d-none">asasa</small>
                                </div>
                
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-success" disabled id="submitbtn">Submit</button>
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
      $('#password_confirmation').keyup(function() {
    var passwordConfirmation = $(this).val();
    var password = $('#password').val();
    var confirmPasswordMsg = $('#comfirm_pass_msg');
    confirmPasswordMsg.removeClass('d-none').text(password !== passwordConfirmation ? 'Password Not Matched' : 'Password Matched');
    confirmPasswordMsg.toggleClass('text-danger', password !== passwordConfirmation);
    confirmPasswordMsg.toggleClass('text-success', password === passwordConfirmation);
    
    $('#submitbtn').prop('disabled', password !== passwordConfirmation);
});

    </script>
@endsection
