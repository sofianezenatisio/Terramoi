<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Parcelle extends Model
{
    protected $fillable = [
        'site_id',
        'type_parcelle_id',
        'statut',
    ];

    public function site(): BelongsTo
    {
        return $this->belongsTo(Site::class);
    }

    public function typeParcelle(): BelongsTo
    {
        return $this->belongsTo(TypeParcelle::class);
    }

    public function locations(): HasMany
    {
        return $this->hasMany(Location::class);
    }
}
