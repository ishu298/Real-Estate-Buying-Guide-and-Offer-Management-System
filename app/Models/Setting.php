<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
   
    protected $table = 'settings';
    protected $fillable = [
        'name',
        'value',
        'slug',
        'image'
    ];

 

    public function getImageAttribute($value)
    {
        if (!empty($value)) {
            return [
                'name' => $value,
                'path' =>env('AWS_URL').env('AWS_FOLDER_NAME').$value
            ];
        }
        return [];
    }



}
