@extends('layouts.app')

@section('title', 'Administration')

@section('content')

    <section class="hero">

        <h2>Tableau de bord Administrateur</h2>

        <p>
            Bienvenue dans l'espace d'administration de Terramoi.
        </p>

        <p>
            Depuis cette page, vous pouvez gérer les différents éléments
            de l'application.
        </p>

    </section>

    <div class="cards">

        <div class="card">

            <h3> Sites</h3>

            <p>
                Consulter les sites et leurs parcelles.
            </p>

            <a href="{{ route('admin.sites.index') }}">
                Gérer les sites
            </a>

        </div>

        <div class="card">

            <h3>  Parcelles</h3>

            <p>
                Consulter les parcelles et leurs informations.
            </p>

            <a href="{{ route('admin.sites.index') }}">
                Voir les parcelles
            </a>

        </div>

        <div class="card">

            <h3> Clients</h3>

            <p>
                Gérer les clients de Terramoi.
            </p>

 <a href="{{ route('admin.clients.index') }}">
        Gérer les clients
    </a>

        </div>

<div class="card">

    <h3>Contrats</h3>

    <p>
        Consulter et gérer les contrats de location.
    </p>

    <a href="{{ route('admin.contrats.index') }}">
        Gérer les contrats
    </a>

        </div>

    </div>

@endsection
