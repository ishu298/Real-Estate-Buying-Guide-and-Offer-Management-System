<?php

namespace App\Models;

use App\Models\ContactReply;
use Illuminate\Support\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class Contact extends Model
{
    use SoftDeletes;
    protected $tabble = 'contacts';
    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'message',
    ];


    public function contact_replies(){
        return $this->hasMany(ContactReply::class,'contact_id');
    }

    public function getUpdatedAtAttribute($value)
    {
        // Remove the dd($value) line, as it stops the execution
        if (!empty($value)) {
            return Carbon::parse($value)->format('M d, Y');
        } 

        // If $value is empty, you might want to return something or handle it differently
        return null; // Or return $value; depending on your requirements
    }

       public function getCreatedAtAttribute($value)
    {
        // Remove the dd($value) line, as it stops the execution
        if (!empty($value)) {
            return Carbon::parse($value)->format('M d, Y');
        } 

        // If $value is empty, you might want to return something or handle it differently
        return null; // Or return $value; depending on your requirements
    }


    
}
