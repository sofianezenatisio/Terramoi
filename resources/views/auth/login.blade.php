@extends('layouts.app')

@section('title', 'Connexion')

@section('content')

    <section class="hero">

        <h2>Connexion à Terramoi</h2>

        <p>
            Connectez-vous pour accéder à votre espace.
        </p>

    </section>

    <form method="POST" action="{{ route('login.post') }}">

        @csrf

        <div class="card">

            <p>
                <label for="email">Email</label><br>

                <input
                    type="email"
                    id="email"
                    name="email"
                    value="{{ old('email') }}"
                    required
                >
            </p>

            <p>
                <label for="password">Mot de passe</label><br>

                <input
                    type="password"
                    id="password"
                    name="password"
                    required
                >
            </p>

            @error('email')
                <p>{{ $message }}</p>
            @enderror

            <button type="submit">
                Se connecter
            </button>

        </div>

    </form>

@endsection
