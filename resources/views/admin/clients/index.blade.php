@extends('layouts.app')

@section('title', 'Gestion des clients')

@section('content')

    <h2>Gestion des clients</h2>

    <p>
        Voici les clients enregistrés dans Terramoi.
    </p>

    <div class="cards">

        @forelse ($clients as $client)

            <div class="card">

                <h3>
                    {{ $client->prenom }} {{ $client->nom }}
                </h3>

                <p>
                    <strong>Email :</strong>
                    {{ $client->email }}
                </p>

                <p>
                    <strong>Téléphone :</strong>
                    {{ $client->telephone ?? 'Non renseigné' }}
                </p>

                <p>
                    <strong>Locations :</strong>
                    {{ $client->locations_count }}
                </p>

                <p>
                    <strong>Demandes :</strong>
                    {{ $client->demandes_count }}
                </p>

                <a href="{{ route('admin.clients.show', $client->id) }}">
                    Voir le client
                </a>

            </div>

        @empty

            <div class="card">

                <h3>Aucun client</h3>

                <p>
                    Aucun client n'est actuellement enregistré.
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

