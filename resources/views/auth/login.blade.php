@extends('layouts.app')

@section('title', 'Connexion')

@section('content')

    <h2>Connexion</h2>

    <form method="POST" action="{{ route('login') }}">
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
