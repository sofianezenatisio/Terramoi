<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcelle</title>
</head>
<body>

    <h1>Parcelle #{{ $parcelle->id }}</h1>

    <h2>Informations</h2>

    <p>
        <strong>Statut :</strong>
        {{ $parcelle->statut }}
    </p>

    <h2>Site</h2>

    @if ($parcelle->site)
        <p><strong>Nom :</strong> {{ $parcelle->site->nom }}</p>
        <p><strong>Adresse :</strong> {{ $parcelle->site->adresse }}</p>

        <h3>Équipements du site</h3>

        @forelse ($parcelle->site->equipementSites as $equipement)
            <p>{{ $equipement->libelle }}</p>
        @empty
            <p>Aucun équipement.</p>
        @endforelse
    @endif

    <h2>Type de parcelle</h2>

    @if ($parcelle->typeParcelle)
        <p>
            <strong>Type :</strong>
            {{ $parcelle->typeParcelle->libelle }}
        </p>

        <p>
            <strong>Superficie :</strong>
            {{ $parcelle->typeParcelle->superficie }}
        </p>

        <h3>Prix par année</h3>

        @forelse ($parcelle->typeParcelle->typeParcelleAnnees as $tarif)
            <p>
                {{ $tarif->annee->annee ?? 'N/A' }}
                —
                {{ number_format($tarif->prix, 2, ',', ' ') }} €
            </p>
        @empty
            <p>Aucun tarif.</p>
        @endforelse
    @endif

    <h2>Locations</h2>

    @forelse ($parcelle->locations as $location)
        <p>
            Location #{{ $location->id }}
            — Client #{{ $location->client->id ?? 'N/A' }}
            — {{ $location->date?->format('d/m/Y') }}
        </p>
    @empty
        <p>Aucune location.</p>
    @endforelse

    <p>
        <a href="{{ route('welcome') }}">Retour à l'accueil</a>
    </p>

</body>
</html>
