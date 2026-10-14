<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Client extends Model
{

protected $fillable = [
    'nom',
    'prenom',
    'email',
    'telephone',
    'adresse',
];
    public function locations(): HasMany
    {
        return $this->hasMany(Location::class);
    }

    public function demandes(): HasMany
    {
        return $this->hasMany(Demande::class);
    }
}
