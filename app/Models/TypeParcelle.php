<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TypeParcelle extends Model
{
    protected $fillable = [
        'libelle',
        'superficie',
    ];

    public function parcelles(): HasMany
    {
        return $this->hasMany(Parcelle::class);
    }

    public function typeParcelleAnnees(): HasMany
    {
        return $this->hasMany(TypeParcelleAnnee::class);
    }
}
