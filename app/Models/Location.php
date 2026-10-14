<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Location extends Model
{
    protected $fillable = [
        'date',
        'date_paiement',
        'date_location',
        'client_id',
        'parcelle_id',
    ];

    protected $casts = [
        'date' => 'date',
        'date_paiement' => 'date',
        'date_location' => 'date',
    ];

    public function client(): BelongsTo
    {
        return $this->belongsTo(Client::class);
    }

    public function equipements(): BelongsToMany
    {
        return $this->belongsToMany(
            Equipement::class,
            'location_equipement'
        )->withTimestamps();
    }

    public function parcelle(): BelongsTo
    {
        return $this->belongsTo(Parcelle::class);
    }
}
