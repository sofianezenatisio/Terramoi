@extends('layouts.app')

@section('title', $site->nom)

@section('content')

    <h2>{{ $site->nom }}</h2>

    <p>
        <strong>Adresse :</strong>
        {{ $site->adresse }}
    </p>

    <h3>Les parcelles du site</h3>

    <div class="cards">

        @foreach ($site->parcelles as $parcelle)

            <div class="card">

                <h3>Parcelle {{ $parcelle->id }}</h3>

                <p>
                    <strong>Type :</strong>
                    {{ $parcelle->typeParcelle->libelle }}
                </p>

                <p>
                    <strong>Superficie :</strong>
                    {{ $parcelle->typeParcelle->superficie }} m²
                </p>

                <p>
                    <strong>Statut :</strong>
                    {{ $parcelle->statut }}
                </p>

                <a href="{{ route('parcelles.show', $parcelle->id) }}">
                    Voir la parcelle
                </a>

            </div>

        @endforeach

    </div>

    <p>
        <a href="{{ route('admin.sites.index') }}">
            ← Retour aux sites
        </a>
    </p>

@endsection
