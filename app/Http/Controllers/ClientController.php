<?php

namespace App\Http\Controllers;

use App\Models\Client;

class ClientController extends Controller
{
    public function index()
    {
        $clients = Client::withCount([
            'locations',
            'demandes',
        ])->get();

        return view('admin.clients.index', [
            'clients' => $clients,
        ]);
    }

    public function show(int $id)
    {
        $client = Client::with([
            'locations.equipement',
            'locations.parcelle.site',
            'locations.parcelle.typeParcelle',
            'demandes.prestations',
        ])->findOrFail($id);

        return view('admin.clients.show', [
            'client' => $client,
        ]);
    }
}

