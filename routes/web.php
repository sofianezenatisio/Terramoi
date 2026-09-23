<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DossierController;
use App\Http\Controllers\ContratController;
use App\Http\Controllers\ParcelleController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dossiers/{numParticuliers}', [DossierController::class, 'show']);

Route::get('/gererContrats/{numContrat}', [ContratController::class, 'show']);

Route::get('/sites/parcelles/{numParcelle}', [ParcelleController::class, 'show']);

Route::fallback(function () {
    return response()->view('welcome');
});
