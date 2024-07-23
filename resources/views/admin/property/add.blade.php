<!-- resources/views/admin/property.blade.php -->

@extends('layouts.master')

@section('content')
<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Include FontAwesome for cross icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>{{ isset($property) ? 'Edit' : 'Add' }} Property</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">{{ isset($property) ? 'Edit' : 'Add' }} Property</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-sm-12">
                <div class="card card-success">
                    <div class="card-header">
                        <h3 class="card-title">Enter Property Details</h3>
                    </div>
                    <form action="{{route('admin.property_store')}}" method="POST" enctype="multipart/form-data" id="propertyForm">
                        @csrf
                      
                        <div class="card-body">
                            <div class="form-group">
                                <input type="hidden" id="id" name="id" class="form-control" value="{{ isset($property) ? $property->id : '' }}">
                            </div>

                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($property) ? $property->name : '') }}" required>
                                @error('name')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea id="description" name="description" class="form-control" rows="3" required>{{ old('description', isset($property) ? $property->description : '') }}</textarea>
                                @error('description')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" id="price" name="price" class="form-control" value="{{ old('price', isset($property) ? $property->price : '') }}" required>
                                @error('price')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="location">Location</label>
                                <input type="text" id="location" name="location" class="form-control" value="{{ old('location', isset($property) ? $property->location : '') }}" required>
                                @error('location')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="bedrooms">Bedrooms</label>
                                <input type="number" id="bedrooms" name="bedrooms" class="form-control" value="{{ old('bedrooms', isset($property) ? $property->bedrooms : '') }}" required>
                                @error('bedrooms')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="bathrooms">Bathrooms</label>
                                <input type="number" id="bathrooms" name="bathrooms" class="form-control" value="{{ old('bathrooms', isset($property) ? $property->bathrooms : '') }}" required>
                                @error('bathrooms')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="square_feet">Square Feet</label>
                                <input type="number" id="square_feet" name="square_feet" class="form-control" value="{{ old('square_feet', isset($property) ? $property->square_feet : '') }}" required>
                                @error('square_feet')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="type">Type</label>
                                <input type="text" id="type" name="type" class="form-control" value="{{ old('type', isset($property) ? $property->type : '') }}" required>
                                @error('type')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="images">Images</label>
                                <div id="image-preview" class="row">
                                    <!-- Existing image previews -->
                                    @if(isset($property) && $property->images->count() > 0)
                                        @foreach($property->images as $image)
                                            <div class="image-preview-item">
                                                <img src="{{ asset($image->path) }}" class="img-thumbnail">
                                                <button type="button" class="btn-remove"><i class="fas fa-times"></i></button>
                                                <input type="hidden" name="existing_images[]" value="{{ $image->id }}">
                                            </div>
                                        @endforeach
                                    @endif
                                    <!-- End existing image previews -->

                                    <!-- Hidden file input for new images -->
                                   
                                </div>
                                <div class="input-group mt-3">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" id="add-more">Add More</button>
                                    </div>
                                </div>
                                @error('images.*')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" class="form-control" required>
                                    <option value="">Select Status</option>
                                    <option value="available" {{ isset($property) && $property->status == 'available' ? 'selected' : '' }}>Available</option>
                                    <option value="unavailable" {{ isset($property) && $property->status == 'unavailable' ? 'selected' : '' }}>Unavailable</option>
                                </select>
                                @error('status')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    .image-preview-item {
        position: relative;
        display: inline-block;
        margin-right: 10px;
        margin-bottom: 10px;
    }
    .image-preview-item img {
        max-width: 100px;
        height: auto;
        display: block;
    }
    .image-preview-item .btn-remove {
        position: absolute;
        top: 5px;
        right: 5px;
        padding: 5px;
        background-color: rgba(255, 255, 255, 0.8);
        border: none;
        border-radius: 50%;
        cursor: pointer;
    }
    .image-preview-item .btn-remove i {
        color: red;
    }
</style>
<script>
$(document).ready(function() {
    var fileInputCounter = 0;

    $('#add-more').on('click', function() {
        var fileInput = $('<input>').attr({
            type: 'file',
            name: 'images[]',
            accept: 'image/*',
            style: 'display:none'
        });

        var previewDiv = $('<div>').addClass('image-preview-item');
        
       
        var wrapperDiv = $('<div>').addClass('image-input-wrapper');
        wrapperDiv.append(fileInput); 
        wrapperDiv.append(previewDiv);

        $('#image-preview').append(wrapperDiv);
        fileInput.click();
        fileInputCounter++;
    });

    $(document).on('change', 'input[type=file]', function() {
        var files = $(this)[0].files;
        var wrapperDiv = $(this).closest('.image-input-wrapper');

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader(); 

            reader.onload = function(e) {
                var imgSrc = e.target.result;  

                var preview = '<div class="image-preview-item">';
                preview += '<img src="' + imgSrc + '" class="img-thumbnail">';
                preview += '<button type="button" class="btn-remove"><i class="fas fa-times"></i></button>';
                preview += '</div>';

                wrapperDiv.find('.image-preview-item').remove(); 
                wrapperDiv.append(preview);
            };

            reader.readAsDataURL(file);
        }
    });

    $(document).on('click', '.btn-remove', function() {
        var previewDiv = $(this).closest('.image-preview-item');
        var wrapperDiv = previewDiv.closest('.image-input-wrapper');

        previewDiv.remove();
        if (wrapperDiv.find('.image-preview-item').length === 0) {
            wrapperDiv.remove();
        }
    });
});

</script>

@endsection
