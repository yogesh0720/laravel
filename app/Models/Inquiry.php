<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    protected $fillable = [
        'firstName', 'lastName', 'address', 'contactNo',
        'emailID', 'occupation', 'inquiryFor', 'status'
    ];
}
