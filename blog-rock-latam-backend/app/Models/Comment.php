<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = 'comment'; // Nombre de la tabla
    protected $primaryKey = 'id_comment'; // Clave primaria personalizada
    public $timestamps = true; // Habilita timestamps

    // Columnas que se pueden llenar masivamente
    protected $fillable = ['id_forum', 'id_user', 'context'];

    // Relaciones
    public function forum()
    {
        return $this->belongsTo(Forum::class, 'id_forum');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
