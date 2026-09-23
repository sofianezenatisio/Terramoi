<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dossier client</title>
</head>
<body>

    <h1>Dossier du client #{{ $client->id }}</h1>

    <h2>Locations</h2>

    @forelse ($client->locations as $location)
        <div>
            <p><strong>Location :</strong> #{{ $location->id }}</p>
            <p><strong>Date :</strong> {{ $location->date?->format('d/m/Y') }}</p>

            <p>
                <strong>Équipement :</strong>
                {{ $location->equipement->libelle ?? 'Non renseigné' }}
            </p>

            <p>
                <strong>Parcelle :</strong>
                #{{ $location->parcelle->id ?? 'N/A' }}
            </p>

            <p>
                <strong>Site :</strong>
                {{ $location->parcelle->site->nom ?? 'Non renseigné' }}
            </p>

            <hr>
        </div>
    @empty
        <p>Aucune location pour ce client.</p>
    @endforelse


    <h2>Demandes</h2>

    @forelse ($client->demandes as $demande)
        <div>
            <p>
                <strong>Demande #{{ $demande->id }}</strong>
            </p>

            <p>
                {{ $demande->consultation }}
            </p>

            <h3>Prestations</h3>

            @forelse ($demande->prestations as $prestation)
                <p>
                    {{ $prestation->type }}
                    — {{ number_format($prestation->prix, 2, ',', ' ') }} €
                </p>
            @empty
                <p>Aucune prestation.</p>
            @endforelse

            <hr>
        </div>
    @empty
        <p>Aucune demande pour ce client.</p>
    @endforelse

    <p>
        <a href="{{ route('welcome') }}">Retour à l'accueil</a>
    </p>

</body>
</html>
