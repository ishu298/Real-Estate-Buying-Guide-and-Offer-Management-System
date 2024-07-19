@extends('layouts.master')
@section('content')
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
            <a href="{{route('admin.add_user')}}"><button type="button" class="btn btn-primary mb-2 m-3">
                    Add User
                </button></a>

            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $Sno = 1; ?>
                        @foreach ($lists as $list)
        
                            <tr>
                                <td>{{ $Sno }}</td>
                                <td>{{ $list->name }}</td>
                                <td>{{ $list->email }}</td>
                                
                                <td>{{ \App\Helpers\CommonHelper::formatDate($list->created_at, 'd-m-Y') }}</td>
                                <td>
                                    
                                    <a class="btn btn-success" href="{{ route('admin.edit_user', ['id' => $list['id']]) }}">Edit</a>
                                    <a class="btn btn-danger" href="{{ route('admin.delete_user', ['id' => $list['id']]) }}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                            <?php $Sno++; ?>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
