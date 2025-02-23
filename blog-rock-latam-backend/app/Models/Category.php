<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'id_category';
    protected $fillable = ['name','description'];

    // Relaciones
    public function forums() : \Illuminate\Database\Eloquent\Relations\BelongsToMany {
        return $this->belongsToMany(Forum::class, 'forum_category',
        'id_category',
        'id_forum');        
    }
}
