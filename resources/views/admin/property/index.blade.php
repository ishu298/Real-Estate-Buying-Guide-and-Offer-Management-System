@extends('layouts.master')

@section('content')
<style>
    .property-image-container {
        position: relative;
        display: inline-block;
        width: 200px; /* Adjust width as needed */
        height: 200px; /* Adjust height as needed */
        overflow: hidden; /* Ensures images don't overflow container */
    }

    .property-image-container img {
        width: 100%;
        height: 100%;
        object-fit: cover; 
        transition: opacity 0.5s ease;
    }
</style>

<!-- Magnific Popup CSS -->
<link rel="stylesheet" href="{{ asset('dist/magnific-popup.css') }}">

<div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
    <div class="widget-content widget-content-area br-6">
        <a href="{{ route('admin.property_add') }}">
            <button type="button" class="btn btn-primary mb-2 m-3">Add property</button>
        </a>

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
                        <th>Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Bed Rooms</th>
                        <th>Bath Rooms</th>
                        <th>Images</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php $Sno = 1; @endphp
                    @foreach ($properties as $property)
                    <tr>
                        <td>{{ $Sno }}</td>
                        <td>{{ $property->name }}</td>
                        <td>{{ $property->description }}</td>
                        <td>{{ $property->price }}</td>
                        <td>{{ $property->location }}</td>
                        <td>{{ $property->bedrooms }}</td>
                        <td>{{ $property->bathrooms }}</td>


                        <td>
                            @if($property->images->isNotEmpty())
                            <div class="property-image-container gallerys">
                                @foreach($property->images as $key => $image)
                                <a href="{{ asset($image->image_path) }}">
                                    <img src="{{ asset($image->image_path) }}" class="img-fluid" alt="Thumbnail">
                                </a>
                                @endforeach
                            </div>
                            @else
                            No Thumbnail
                            @endif
                        </td>
                        <td>{{ \App\Helpers\CommonHelper::formatDate($property->created_at, 'd-m-Y') }}</td>
                        <td>
                            <a class="btn btn-success" href="{{ route('admin.property_add', ['id' => $property->id]) }}">Edit</a>
                            <a class="btn btn-danger" href="{{ route('admin.property_delete', ['id' => $property->id]) }}" onclick="return confirm('Are you sure?');">Delete</a>
                        </td>
                    </tr>
                    @php $Sno++; @endphp
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection

<!-- jQuery and Magnific Popup JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="{{ asset('dist/jquery.magnific-popup.js') }}"></script>
<script>
    jQuery(document).ready(function($) {
        // Initialize Magnific Popup
        $('.gallerys').each(function() {
            $(this).magnificPopup({
                delegate: 'a',
                type: 'image',
                gallery: {
                    enabled: true,
                    arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
                },
            });
        });
    });
</script>

@push('scripts')

@endpush
