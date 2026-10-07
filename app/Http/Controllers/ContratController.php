<?php

namespace App\Http\Controllers;

use App\Models\Location;

class ContratController extends Controller
{
    public function index()
    {
        $contrats = Location::with([
            'client',
            'equipement',
            'parcelle.site',
            'parcelle.typeParcelle',
        ])->get();

        return view('admin.contrats.index', [
            'contrats' => $contrats,
        ]);
    }

    public function show(int $id)
    {
        $location = Location::with([
            'client',
            'equipement',
            'parcelle.site',
            'parcelle.typeParcelle',
        ])->find($id);

        if (!$location) {
            return redirect()->route('welcome');
        }

        return view('contrats.show', [
            'location' => $location,
        ]);
    }
}
