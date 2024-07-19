<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class ContactReply extends Model
{
    use SoftDeletes;
    protected $tabble = 'contact_reply';
    protected $fillable = [
        'reply_text',
        'contact_id'
    ];

    public function contact(){
        return $this->belongsTo('App\Models\Contact','contact_id');
    }
}
