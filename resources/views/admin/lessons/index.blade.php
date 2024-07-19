@extends('layouts.master')
@section('content')
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
            <a href="{{route('admin.lesson_add')}}"><button type="button" class="btn btn-primary mb-2 m-3">
                    Add Lesson
                </button></a>
    @if (session('success'))
    <div class="alert alert-success" id="successAlert">
        {{ session('success') }}
    </div>
    <script>
        setTimeout(function() {
            document.getElementById('successAlert').style.display = 'none';
        }, 1000); 
    </script>
@endif
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Video</th>
                            <th>Thumbnail</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $Sno = 1; ?>
                        @foreach ($lessons as $lesson)
        
                            <tr>
                                <td>{{ $Sno }}</td>
                                <td>{{ $lesson->title }}</td>
                                <td>{{ $lesson->description }}</td>
                                <td>
                                    <video width="200" controls>
                                        <source src="{{ $lesson->video_url }}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                </td>
                                <td>
                                    @if($lesson->thumbnail_url)
                                        <img src="{{ asset($lesson->thumbnail_url) }}" alt="Thumbnail" style="width: 100px;">
                                    @else
                                        No Thumbnail
                                    @endif
                                </td>
                                <td>{{ \App\Helpers\CommonHelper::formatDate($lesson->created_at, 'd-m-Y') }}</td>
                                <td>
                                    
                                    <a class="btn btn-success" href="{{ route('admin.lesson_add', ['id' => $lesson['id']]) }}">Edit</a>
                                    <a class="btn btn-danger" href="{{ route('admin.lesson_delete', ['id' => $lesson['id']]) }}"
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
@push('script')
@endpush