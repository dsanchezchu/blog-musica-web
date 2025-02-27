<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Forum extends Model
{
    public $table = 'forum';
    public $primaryKey = 'id_forum';
    public $timestamps = true;
    public $fillable = ['content','author','publication_date','update_date','popular','title', 'image_forum'];

    // Relaciones
    public function author() : BelongsTo {
        return $this->belongsTo(User::class, 'author');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class, 'id_forum');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'forum_category', 'id_forum', 'id_category');
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'forum_tag', 'id_forum', 'id_tag');
    }
}
