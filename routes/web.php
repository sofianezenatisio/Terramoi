<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\DossierController;
use App\Http\Controllers\ContratController;
use App\Http\Controllers\ParcelleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\ClientController;



Route::get('/', function () {

    if (!Auth::check()) {
        return redirect()->route('login');
    }

    return view('welcome');

})->name('welcome');


Route::get('/connexion', [AuthController::class, 'showLogin'])
    ->name('login');

Route::post('/connexion', [AuthController::class, 'login'])
    ->name('login.post');

Route::post('/deconnexion', [AuthController::class, 'logout'])
    ->name('logout');


Route::middleware(['auth', 'admin'])->group(function () {

    Route::get('/admin', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');



    Route::get('/admin/sites', [SiteController::class, 'index'])
        ->name('admin.sites.index');

    Route::get('/admin/sites/{id}', [SiteController::class, 'show'])
        ->name('admin.sites.show');



    Route::get('/admin/clients', [ClientController::class, 'index'])
        ->name('admin.clients.index');

    Route::get('/admin/clients/{id}', [ClientController::class, 'show'])
        ->name('admin.clients.show');



    Route::get('/admin/contrats', [ContratController::class, 'index'])
        ->name('admin.contrats.index');

});



Route::get('/dossiers/{id}', [DossierController::class, 'show'])
    ->name('dossiers.show');

Route::get('/gererContrats/{id}', [ContratController::class, 'show'])
    ->name('contrats.show');

Route::get('/sites/parcelles/{id}', [ParcelleController::class, 'show'])
    ->name('parcelles.show');



Route::fallback(function () {
    abort(404);
});
