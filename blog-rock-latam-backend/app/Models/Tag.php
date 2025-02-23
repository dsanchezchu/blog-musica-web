<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $table = 'tag';
    protected $primaryKey = 'id_tag';
    protected $timestamps = false;
    protected $fillable = ['name'];

    public function forums() : \Illuminate\Database\Eloquent\Relations\BelongsToMany {
        return $this->belongsToMany(Forum::class, 'forum_tag',
        'id_tag',
        'id_forum');        
    }
}
