<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use  App\Models\Lesson;
use Illuminate\Support\Facades\Storage;

class LessonController extends Controller
{
    public function index()
    {
        $lessons = Lesson::latest()->paginate(10);
        return view('admin.lessons.index', compact('lessons'));
    }

    public function create($id=null)
    {   
        if($id){
           $lesson = Lesson::find($id);
        }else{
            $lesson = null;
        }
        return view('admin.lessons.add',compact('lesson'));
    }

    
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'video_url' => $request->id ? 'nullable|file|max:20480' : 'required|file|max:20480', 
            'thumbnail_url' => 'nullable|file|mimes:jpeg,png,jpg,gif|max:2048', 
        ]);
    

        if ($request->hasFile('video_url')) {
            $videoPath = $request->file('video_url')->store('videos', 'public');
        } else {
            $currentLesson = Lesson::find($request->id);
            $videoPath = str_replace('/storage', '', $currentLesson->video_url); ;
        }
    
        if ($request->hasFile('thumbnail_url')) {
            $thumbnailPath = $request->file('thumbnail_url')->store('thumbnails', 'public');
        }elseif($request->id){
            $currentLesson = Lesson::find($request->id);
            $thumbnailPath = str_replace('/storage', '', $currentLesson->thumbnail_url);
        }

        $lessonData = [
            'title' => $validatedData['title'],
            'description' => $validatedData['description'],
            'video_url' => Storage::url($videoPath),
            'thumbnail_url' => isset($thumbnailPath) ? Storage::url($thumbnailPath):null,
        ];
    
        Lesson::updateOrCreate(['id' => $request->id], $lessonData);

        return redirect()->route('admin.lesson_list')->with('success', $request->id?'Lesson Update Successfully.':'Lesson Save Successfully.');
    }
    
    public function delete($id){
        $lesson = Lesson::find($id);
        $lesson->delete();
        return back()->with('success','Lesson Delete Successfully .');
    }
}
