<?php
// app/Models/EnquireReply.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EnquireReply extends Model
{
    protected $table = 'enquire_replies';

    protected $fillable = [
        'reply_text',
        'enquire_id',
    ];

    public function enquires(){
        return $this->belongsTo('App\Models\Enquire','enquire_id');
    }
}

?>