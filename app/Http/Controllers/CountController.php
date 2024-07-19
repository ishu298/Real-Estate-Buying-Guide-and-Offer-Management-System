<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Lesson;
use App\Models\Property;


class CountController extends Controller
{
    public function index()
    {
        $data['usercount'] = User::all()->count();
     
        $data['lessoncount'] = Lesson::all()->count();
        
        $data['properties'] = Property::all()->count();

        return view('dashboard',compact('data'));
    }
}
