<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User; 

class EditorDetails extends Model
{
    protected $table = 'editor_details'; // Nombre de la tabla
    protected $primaryKey = 'id_editor'; // Clave primaria personalizada
    public $timestamps = false; // Desactiva timestamps

    // Columnas que se pueden llenar masivamente
    protected $fillable = ['id_user', 'experience'];

    // Relación uno a uno con User
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
