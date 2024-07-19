<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dimension extends Model
{
    protected $fillable = [
        'post_id',
        'selling_price',
        'offer_price',
        'shipping_charge',
        'dimensions',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }
}
