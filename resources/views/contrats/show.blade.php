<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contrat</title>
</head>
<body>

    <h1>Contrat / Location #{{ $location->id }}</h1>

    <h2>Informations</h2>

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

    <h2>Client</h2>

    <p>Client #{{ $location->client->id }}</p>

    <h2>Équipement</h2>

    <p>
        {{ $location->equipement->libelle ?? 'Non renseigné' }}
    </p>

    <h2>Parcelle</h2>

    @if ($location->parcelle)
        <p>Parcelle #{{ $location->parcelle->id }}</p>

        <p>
            <strong>Statut :</strong>
            {{ $location->parcelle->statut }}
        </p>

        <p>
            <strong>Site :</strong>
            {{ $location->parcelle->site->nom ?? 'Non renseigné' }}
        </p>

        <p>
            <strong>Type :</strong>
            {{ $location->parcelle->typeParcelle->libelle ?? 'Non renseigné' }}
        </p>
    @endif

    <p>
        <a href="{{ route('welcome') }}">Retour à l'accueil</a>
    </p>

</body>
</html>
