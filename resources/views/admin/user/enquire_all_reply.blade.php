@extends('layouts.master')
@section('content')
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
          
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Reply</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                            @foreach($lists->enquire_replies as $replyData)
                            <tr>
                                <td>{{ $lists->name }}</td>
                                <td>{{ $lists->email }}</td>
                                <td>{{ $replyData->reply_text }}</td>    
                                                            
                                <td>{{ $lists->created_at }}</td>
                                <td>
                                    <a class="btn btn-danger" href="{{ route('admin.delete_enquire_reply', ['id' => $replyData['id'],'contact_id'=>$lists['id']]) }}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                            @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

   
@endsection
