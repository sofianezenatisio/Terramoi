@extends('layouts.app')

@section('title', 'Client')

@section('content')

    <h2>
        {{ $client->prenom }} {{ $client->nom }}
    </h2>

    <div class="card">

        <h3>Informations du client</h3>

        <p>
            <strong>Nom :</strong>
            {{ $client->nom }}
        </p>

        <p>
            <strong>Prénom :</strong>
            {{ $client->prenom }}
        </p>

        <p>
            <strong>Email :</strong>
            {{ $client->email }}
        </p>

        <p>
            <strong>Téléphone :</strong>
            {{ $client->telephone ?? 'Non renseigné' }}
        </p>

    </div>

    <h3>Locations</h3>

    @forelse ($client->locations as $location)

        <div class="card">

            <p>
                <strong>Location :</strong>
                {{ $location->id }}
            </p>

            <p>
                <strong>Date :</strong>
                {{ $location->date }}
            </p>

            @if ($location->parcelle)

                <p>
                    <strong>Parcelle :</strong>
                    {{ $location->parcelle->id }}
                </p>

                @if ($location->parcelle->site)
                    <p>
                        <strong>Site :</strong>
                        {{ $location->parcelle->site->nom }}
                    </p>
                @endif

                @if ($location->parcelle->typeParcelle)
                    <p>
                        <strong>Type :</strong>
                        {{ $location->parcelle->typeParcelle->libelle }}
                    </p>
                @endif

            @endif

        </div>

    @empty

        <div class="card">
            <p>Aucune location pour ce client.</p>
        </div>

    @endforelse

    <h3>Demandes</h3>

    @forelse ($client->demandes as $demande)

        <div class="card">

            <p>
                <strong>Demande :</strong>
                {{ $demande->consultation }}
            </p>

            @if ($demande->prestations->count() > 0)

                <p>
                    <strong>Prestations :</strong>
                </p>

                <ul>
                    @foreach ($demande->prestations as $prestation)
                        <li>
                            {{ $prestation->type }}
                            - {{ $prestation->prix }} €
                        </li>
                    @endforeach
                </ul>

            @endif

        </div>

    @empty

        <div class="card">
            <p>Aucune demande pour ce client.</p>
        </div>

    @endforelse

    <p>
        <a href="{{ route('admin.clients.index') }}">
            ← Retour aux clients
        </a>
    </p>

@endsection
