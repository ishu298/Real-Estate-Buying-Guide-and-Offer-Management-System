@extends('layouts.master')
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Dashboard</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard v1</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->


<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{ $data['usercount'] }}</h3>

                        <p>Users</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <a href="{{ route('admin.add_user') }}" class="small-box-footer">Add Lesson <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>{{ $data['properties'] }}<sup style="font-size: 20px"></sup></h3>

                        <p>Properties</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-th-large"></i>
                    </div>
                    <a href="{{route('admin.property_add')}}" class="small-box-footer">Add  Properties  <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3>{{$data['lessoncount']}}</h3>
                        <p>Lessons</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-blog"></i>
                    </div>
                    <a href="{{ route('admin.lesson_add') }}" class="small-box-footer">Add Lessons<i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h3>{{$data['usercount']}}</h3>

                        <p>Events</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">Add Event <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
                <div class="col-lg-6">
                        <div class="card">
                            <h4 class="p-3">Recent Orders</h4>
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th scope="col">S. No</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Action</th>
                                  </tr>
                                </thead>
                                <tbody>
                                   
                                  <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#" class="btn btn-success">View Detail</a></td>
                                  </tr>
                                 
                                  <tr><td colspan="5"><center>No Data Found!</center></td></tr>    
                                  
                                </tbody>
                              </table>
                        </div>
                </div>

                <div class="col-lg-6">
                    <div class="card">
                        <h4 class="p-3">Recent Acquire Products</h4>
                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">S. No</th>
                                <th scope="col">Title</th>
                                <th scope="col">Selling Price</th>
                                <th scope="col">Offer Price</th>
                                <th scope="col">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                               
                              <tr>
                                <th scope="row"></th>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><a href="#" class="btn btn-success">Edit</a></td>
                              </tr>
                              
                              <tr><td colspan="5"><center>No Orders!</center></td></tr>    
                              
                            </tbody>
                          </table>
                    </div>
            </div>

        </div>
        <!-- /.row (main row) -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->

@endsection