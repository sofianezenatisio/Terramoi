<?php

namespace App\Http\Controllers;

use App\Models\Site;

class SiteController extends Controller
{
    public function index()
    {
        $sites = Site::withCount('parcelles')->get();

        return view('admin.sites.index', [
            'sites' => $sites,
        ]);
    }

    public function show(int $id)
    {
        $site = Site::with([
            'parcelles.typeParcelle'
        ])->findOrFail($id);

        return view('admin.sites.show', [
            'site' => $site,
        ]);
    }
}
