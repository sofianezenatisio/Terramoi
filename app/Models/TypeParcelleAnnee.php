<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TypeParcelleAnnee extends Model
{
    protected $fillable = [
        'type_parcelle_id',
        'annee_id',
        'prix',
    ];

    public function typeParcelle(): BelongsTo
    {
        return $this->belongsTo(TypeParcelle::class);
    }

    public function annee(): BelongsTo
    {
        return $this->belongsTo(Annee::class);
    }
}
