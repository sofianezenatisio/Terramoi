<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Annee extends Model
{
    protected $fillable = [
        'annee',
    ];

    public function typeParcelleAnnees(): HasMany
    {
        return $this->hasMany(TypeParcelleAnnee::class);
    }
}
