@extends('layouts.app')

@section('title', 'Parcelle')

@section('content')

    <h2>Parcelle</h2>

    <p>
        <strong>Numéro :</strong>
        {{ $parcelle->id }}
    </p>

    <hr>

    <div class="card">

        <h3>Informations</h3>

        <p>
            <strong>Statut :</strong>
            {{ $parcelle->statut }}
        </p>

        <p>
            <strong>Type :</strong>
            {{ $parcelle->typeParcelle?->libelle ?? 'Non renseigné' }}
        </p>

        <p>
            <strong>Superficie :</strong>
            {{ $parcelle->typeParcelle?->superficie ?? 'Non renseignée' }}
        </p>

    </div>

    <div class="card">

        <h3>Site</h3>

        <p>
            <strong>Nom :</strong>
            {{ $parcelle->site?->nom ?? 'Non renseigné' }}
        </p>

        <p>
            <strong>Adresse :</strong>
            {{ $parcelle->site?->adresse ?? 'Non renseignée' }}
        </p>

        <h4>Équipements du site</h4>

        @forelse ($parcelle->site?->equipementSites ?? [] as $equipement)

            <p>{{ $equipement->libelle }}</p>

        @empty

            <p>Aucun équipement.</p>

        @endforelse

    </div>

    <div class="card">

        <h3>Tarifs par année</h3>

        @forelse ($parcelle->typeParcelle?->typeParcelleAnnees ?? [] as $tarif)

            <p>
                <strong>
                    {{ $tarif->annee?->annee ?? 'Année inconnue' }}
                </strong>
                —
                {{ number_format($tarif->prix, 2, ',', ' ') }} €
            </p>

        @empty

            <p>Aucun tarif enregistré.</p>

        @endforelse

    </div>

    <div class="card">

        <h3>Locations</h3>

        @forelse ($parcelle->locations as $location)

            <p>
                Location #{{ $location->id }}
                — Client #{{ $location->client?->id ?? 'inconnu' }}
                — {{ $location->equipement?->libelle ?? 'Équipement inconnu' }}
            </p>

        @empty

            <p>Aucune location.</p>

        @endforelse

    </div>

@endsection
