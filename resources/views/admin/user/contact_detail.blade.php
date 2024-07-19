@extends('layouts.master')
@section('content')
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
            <a href="{{route('admin.contact_list')}}"><button type="button" class="btn btn-primary mb-2 m-3">
                    Back
                </button></a>

            <div class="card-body">
                <table  class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <td>{{ $data->name }}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>{{ $data->email }}</td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td>{{ $data->phone }}</td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td>{{ $data->address }}</td>
                        </tr>
                    
                        <tr>
                            <th>Message</th>
                            <td>{{ $data->message }}</td>
                        </tr>

                        <tr>
                            <th>Added date</th>
                            <td>{{ $data->created_at }}</td>
                        </tr>
                       
                    </thead>
                </table>
            </div>
        </div>
    </div>
@endsection
