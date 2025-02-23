<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class AdminDetails extends Model
{
    protected $table = 'admin_details'; 
    protected $primaryKey = 'id_admin'; 
    public $timestamps = false;
    protected $fillable = ['id_user', 'permissions'];

    // Relación uno a uno con User
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
