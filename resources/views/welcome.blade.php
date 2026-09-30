@extends('layouts.app')

@section('title', 'Accueil')

@section('content')

    <section class="hero">
        <h2>Bienvenue sur Terramoi</h2>

        <p>
            Gestion et location de parcelles de terre.
        </p>

        <p>
            Retrouvez facilement les informations concernant
            les clients, les contrats et les parcelles.
        </p>
    </section>

    <section class="cards">

        <div class="card">
            <h3>Dossiers clients</h3>

            <p>
                Consultez les informations et les locations
                associées à un client.
            </p>

            <a href="{{ route('dossiers.show', 1) }}">
                Voir un dossier
            </a>
        </div>

        <div class="card">
            <h3>Contrats</h3>

            <p>
                Consultez les informations d'un contrat
                de location.
            </p>

            <a href="{{ route('contrats.show', 1) }}">
                Voir un contrat
            </a>
        </div>

        <div class="card">
            <h3>Parcelles</h3>

            <p>
                Consultez les informations d'une parcelle,
                son site, son type et ses tarifs.
            </p>

            <a href="{{ route('parcelles.show', 1) }}">
                Voir une parcelle
            </a>
        </div>

    </section>

@endsection
