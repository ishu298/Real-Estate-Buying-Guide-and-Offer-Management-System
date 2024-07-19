<?php

namespace App\Models;

use App\Models\Post;
use App\Models\EnquireReply;
use Illuminate\Support\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class Enquire extends Model
{
    use SoftDeletes;
    protected $tabble = 'enquires';
    protected $fillable = [
        'name',
        'product_id',
        'email',
        'phone',
        'address',
        'message',
    ];

    public function product()
    {
        return $this->belongsTo(Post::class,'product_id');
    }

    public function enquire_replies(){
        return $this->hasMany(EnquireReply::class,'enquire_id');
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
