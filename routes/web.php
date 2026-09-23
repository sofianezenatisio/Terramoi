<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DossierController;
use App\Http\Controllers\ContratController;
use App\Http\Controllers\ParcelleController;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::get('/dossiers/{id}', [DossierController::class, 'show'])
    ->name('dossiers.show');

Route::get('/gererContrats/{id}', [ContratController::class, 'show'])
    ->name('contrats.show');

Route::get('/sites/parcelles/{id}', [ParcelleController::class, 'show'])
    ->name('parcelles.show');

Route::fallback(function () {
    return redirect()->route('welcome');
});
