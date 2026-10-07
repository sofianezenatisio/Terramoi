@extends('layouts.app')

@section('title', 'Gestion des sites')

@section('content')

    <h2>Gestion des sites</h2>

    <p>Voici les différents sites de Terramoi.</p>

    <div class="cards">

        @foreach ($sites as $site)

            <div class="card">

                <h3>{{ $site->nom }}</h3>

                <p>
                    <strong>Adresse :</strong>
                    {{ $site->adresse }}
                </p>

                <p>
                    <strong>Nombre de parcelles :</strong>
                    {{ $site->parcelles_count }}
                </p>

                <a href="{{ route('admin.sites.show', $site->id) }}">
                    Voir les parcelles
                </a>

            </div>

        @endforeach

    </div>

@endsection
