<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AuthorDetails extends Model
{
    protected $table = 'author_details'; // Nombre de la tabla
    protected $primaryKey = 'id_author'; // Clave primaria personalizada
    public $timestamps = false; // Desactiva timestamps

    // Columnas que se pueden llenar masivamente
    protected $fillable = ['id_user', 'publications'];

    // Relación uno a uno con User
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
