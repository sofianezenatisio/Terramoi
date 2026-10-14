<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Equipement extends Model
{
    protected $fillable = [
        'libelle',
        'tarif_mensuel',
    ];

    public function locations(): BelongsToMany
    {
        return $this->belongsToMany(
            Location::class,
            'location_equipement'
        )->withTimestamps();
    }
}
