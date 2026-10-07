@extends('layouts.app')

@section('title', 'Gestion des contrats')

@section('content')

    <h2>Gestion des contrats</h2>

    <p>
        Voici les contrats de location enregistrés dans Terramoi.
    </p>

    <div class="cards">

        @forelse ($contrats as $contrat)

            <div class="card">

                <h3>
                    Contrat n°{{ $contrat->id }}
                </h3>

                @if ($contrat->client)
                    <p>
                        <strong>Client :</strong>
                        {{ $contrat->client->prenom }}
                        {{ $contrat->client->nom }}
                    </p>
                @endif

                @if ($contrat->parcelle)
                    <p>
                        <strong>Parcelle :</strong>
                        {{ $contrat->parcelle->id }}
                    </p>

                    @if ($contrat->parcelle->site)
                        <p>
                            <strong>Site :</strong>
                            {{ $contrat->parcelle->site->nom }}
                        </p>
                    @endif

                    @if ($contrat->parcelle->typeParcelle)
                        <p>
                            <strong>Type :</strong>
                            {{ $contrat->parcelle->typeParcelle->libelle }}
                        </p>
                    @endif
                @endif

                @if ($contrat->equipement)
                    <p>
                        <strong>Équipement :</strong>
                        {{ $contrat->equipement->libelle }}
                    </p>
                @endif

                <p>
                    <strong>Date :</strong>
                    {{ $contrat->date }}
                </p>

                @if ($contrat->date_location)
                    <p>
                        <strong>Date de location :</strong>
                        {{ $contrat->date_location }}
                    </p>
                @endif

                @if ($contrat->date_paiement)
                    <p>
                        <strong>Date de paiement :</strong>
                        {{ $contrat->date_paiement }}
                    </p>
                @endif

                <a href="{{ route('contrats.show', $contrat->id) }}">
                    Voir le contrat
                </a>

            </div>

        @empty

            <div class="card">

                <h3>Aucun contrat</h3>

                <p>
                    Aucun contrat de location n'est actuellement enregistré.
                </p>

            </div>

        @endforelse

    </div>

    <p>
        <a href="{{ route('admin.dashboard') }}">
            ← Retour à l'administration
        </a>
    </p>

@endsection
