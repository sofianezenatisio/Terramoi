@extends('layouts.app')

@section('title', 'Contrat')

@section('content')

    <h2>Contrat de location</h2>

    <p>
        <strong>Numéro du contrat :</strong>
        {{ $location->id }}
    </p>

    <hr>

    <div class="card">

        <h3>Client</h3>

        <p>
            Numéro :
            {{ $location->client?->id ?? 'Non renseigné' }}
        </p>

    </div>

    <div class="card">

        <h3>Location</h3>

        <p>
            <strong>Date :</strong>
            {{ $location->date?->format('d/m/Y') }}
        </p>

        <p>
            <strong>Date de location :</strong>
            {{ $location->date_location?->format('d/m/Y') ?? 'Non renseignée' }}
        </p>

        <p>
            <strong>Date de paiement :</strong>
            {{ $location->date_paiement?->format('d/m/Y') ?? 'Non renseignée' }}
        </p>

    </div>

    <div class="card">

        <h3>Équipement</h3>

        <p>
            {{ $location->equipement?->libelle ?? 'Non renseigné' }}
        </p>

    </div>

    <div class="card">

        <h3>Parcelle</h3>

        <p>
            <strong>Numéro :</strong>
            {{ $location->parcelle?->id ?? 'Non renseignée' }}
        </p>

        <p>
            <strong>Statut :</strong>
            {{ $location->parcelle?->statut ?? 'Non renseigné' }}
        </p>

        <p>
            <strong>Site :</strong>
            {{ $location->parcelle?->site?->nom ?? 'Non renseigné' }}
        </p>

        <p>
            <strong>Type :</strong>
            {{ $location->parcelle?->typeParcelle?->libelle ?? 'Non renseigné' }}
        </p>

    </div>

@endsection
