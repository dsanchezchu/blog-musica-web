<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class MemberDetails extends Model
{
    protected $table = 'member_details'; 
    protected $primaryKey = 'id_member';
    public $timestamps = false;
    
    // Columnas que se pueden llenar masivamente
    protected $fillable = ['id_user', 'activity', 'years'];

    // Relación uno a uno con User
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}