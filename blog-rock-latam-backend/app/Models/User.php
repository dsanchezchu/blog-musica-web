<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
class User extends Authenticatable
{
    protected $table = 'user';
    protected $primaryKey = 'id_user';
    public $timestamps = true;

    // Columnas que se pueden llenar masivamente
    protected $fillable = [
        'email', 'first_name', 'last_name', 'phone_number', 'password',
        'profile_photo', 'role', 'is_active'
    ];

    // Relaciones

    public function roles(){
        return $this->belongsToMany(Role::class,'user_role','id_user','id_role');
    }

    public function adminDetails()
    {
        return $this->hasOne(AdminDetails::class, 'id_user');
    }

    public function memberDetails()
    {
        return $this->hasOne(MemberDetails::class, 'id_user');
    }

    public function editorDetails()
    {
        return $this->hasOne(EditorDetails::class, 'id_user');
    }

    public function authorDetails()
    {
        return $this->hasOne(AuthorDetails::class, 'id_user');
    }
    
    public function forums()
    {
        return $this->hasMany(Forum::class, 'author');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class, 'id_user');
    }
}
