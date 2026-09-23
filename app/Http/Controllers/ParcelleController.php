<?php

namespace App\Http\Controllers;

use App\Models\Parcelle;

class ParcelleController extends Controller
{
    public function show(int $id)
    {
        $parcelle = Parcelle::with([
            'site.equipementSites',
            'typeParcelle.typeParcelleAnnees.annee',
            'locations.client',
            'locations.equipement',
        ])->find($id);

        if (!$parcelle) {
            return redirect()->route('welcome');
        }

        return view('parcelles.show', [
            'parcelle' => $parcelle,
        ]);
    }
}
