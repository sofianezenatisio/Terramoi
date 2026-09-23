<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Site extends Model
{
    protected $fillable = [
        'nom',
        'adresse',
    ];

    public function parcelles(): HasMany
    {
        return $this->hasMany(Parcelle::class);
    }

    public function equipementSites(): HasMany
    {
        return $this->hasMany(EquipementSite::class);
    }
}
