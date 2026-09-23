<?php namespace App\Http\Controllers; class ParcelleController extends Controller { public function show($numParcelle) { return view('parcelles.show', [ 'numParcelle' => $numParcelle ]); } }
