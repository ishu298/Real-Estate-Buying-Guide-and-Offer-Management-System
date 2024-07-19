<?php

namespace App\Models;

use Illuminate\Support\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class Event extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'name',
        'date',
        'time',
        'venue',
        'description',
        'image',
        'slug',
        'order_number'
    ];
    

    public function setImageAttribute($value)
    {
        $this->attributes['image'] = serialize($value);
    }

    public function getImageAttribute($value)
    {
        if (preg_match('/^a:\d+:{.*}$/', $value)) {
        if (!empty($value) && is_string($value)) {
            $attachments = unserialize($value);
            $attachmentData = [];
            foreach ($attachments as $key => $attachment) {
                $attachmentData[$key]['name'] = $attachment;
                // $attachmentData[$key]['path'] = asset('/featured-image/'.$attachment);
                $s3ImagePath = env('AWS_URL').env('AWS_FOLDER_NAME').$attachment;
                $attachmentData[$key]['path'] = $s3ImagePath;
            }
            return $attachmentData;        
        }
    }
        return [];
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




?>