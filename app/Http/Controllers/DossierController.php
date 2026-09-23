<?php

namespace App\Http\Controllers;

use App\Models\Client;

class DossierController extends Controller
{
    public function show(int $id)
    {
        $client = Client::with([
            'locations.equipement',
            'locations.parcelle.site',
            'locations.parcelle.typeParcelle',
            'demandes.prestations',
        ])->find($id);

        if (!$client) {
            return redirect()->route('welcome');
        }

        return view('dossiers.show', [
            'client' => $client,
        ]);
    }
}
