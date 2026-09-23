<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Equipement extends Model
{
    protected $fillable = [
        'libelle',
    ];

    public function locations(): HasMany
    {
        return $this->hasMany(Location::class);
    }
}
