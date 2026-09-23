<?php namespace App\Http\Controllers; class ContratController extends Controller { public function show($numContrat) { return view('contrats.show', [ 'numContrat' => $numContrat ]); } }
