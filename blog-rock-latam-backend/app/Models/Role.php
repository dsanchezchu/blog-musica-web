<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'roles';
    protected $primaryKey = 'id_role';
    public $timestamps = false;
    protected $fillable = ['name'];

    public function users()
    {
        return $this->belongsToMany(User::class,'user_role','id_role','id_user');
    }
}
