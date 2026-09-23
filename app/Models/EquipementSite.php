<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EquipementSite extends Model
{
    protected $fillable = [
        'site_id',
        'libelle',
    ];

    public function site(): BelongsTo
    {
        return $this->belongsTo(Site::class);
    }
}
