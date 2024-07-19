<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\PropertyImage;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;


class PropertyController extends Controller
{
    public function index()
    {
       // $properties = Property::with('images')->get();

       $properties = Property::all();
        foreach($properties as $p)
        {
            foreach($p->images as $image){
          $s[] = $image->image_path;
            }
        }
        return $s;
        return view('admin.property.index',compact('properties'));
    }

    public function create($id=null)
    {   
        if($id){
           $property = Property::find($id);
        }else{
            $property = null;
        }
        return view('admin.property.add',compact('property'));
    }

    public function store(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required',
        'description' => 'nullable',
        'price' => 'required|numeric',
        'location' => 'required',
        'bedrooms' => 'required|integer',
        'bathrooms' => 'required|integer',
        'square_feet' => 'required|integer',
        'type' => 'required|string',
        'status' => 'required|in:available,unavailable', // Validate against ENUM values
        'images.*' => 'required|image|mimes:jpg,jpeg,png,bmp|max:2048',
    ]);

    // Create or update property data
    $property = Property::updateOrCreate(['id' => $request->id], [
        'name' => $validatedData['name'],
        'description' => $validatedData['description'],
        'price' => $validatedData['price'],
        'location' => $validatedData['location'],
        'bedrooms' => $validatedData['bedrooms'],
        'bathrooms' => $validatedData['bathrooms'],
        'square_feet' => $validatedData['square_feet'],
        'type' => $validatedData['type'],
        'status' => $validatedData['status'],
    ]);

    // Handle image uploads if files are present
    if ($request->hasFile('images')) {
        foreach ($request->file('images') as $image) {
            // Generate a unique name for the image
            $imageName = uniqid() . '_' . time() . '.' . $image->getClientOriginalExtension();

            // Store the image in the specified directory with the generated name
            $image->storeAs('public/images', $imageName); 

            // Store image record in property_images table
            PropertyImage::updateOrCreate(['id' => $request->id], [
                'property_id' => $property->id,
                'image_path' => Storage::url('images/'.$imageName),
            ]);
        }
    }

    // Redirect to property list with success message
    return redirect()->route('admin.property_list')->with('success', $request->id ? 'Property Updated Successfully' : 'Property Added Successfully');
}

    public function delete($id){
        $lesson = Property::find($id);
        $lesson->delete();
        return back()->with('success','Lesson Delete Successfully .');
    }
    
}
