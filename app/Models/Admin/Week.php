<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Week extends Model
{
    use HasFactory;
    
    protected $guarded = ['id'];

    protected $casts   = [
        'id'           => 'integer',
        'slug'         => 'string',
        'day'          => 'string',
        'status'       => 'integer',
        'created_at'   => 'date:Y-m-d',
        'updated_at'   => 'date:Y-m-d',
    ];
}
