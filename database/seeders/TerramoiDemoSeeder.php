<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class TerramoiDemoSeeder extends Seeder
{
    public function run(): void
    {
        DB::transaction(function (): void {
            $sites = DB::table('sites')->orderBy('id')->get();

            if ($sites->count() !== 10) {
                throw new RuntimeException('Il faut exactement 10 sites.');
            }

            $repartition = [14, 12, 11, 10, 10, 10, 9, 9, 8, 7];
            $loueesParSite = [9, 7, 7, 6, 6, 6, 5, 5, 5, 4];

            $types = DB::table('type_parcelles')->orderBy('id')->pluck('id');

            if ($types->count() < 3) {
                throw new RuntimeException('Il faut au moins 3 types de parcelles.');
            }

            // Vérifier les données historiques à conserver.
            $clientExistant = DB::table('clients')->where('id', 1)->first();
            $parcelle1 = DB::table('parcelles')->where('id', 1)->first();
            $location1 = DB::table('locations')->where('id', 1)->first();
            $tracteur = DB::table('equipements')->where('id', 1)->first();
            $associationTracteur = DB::table('location_equipement')
                ->where('location_id', 1)
                ->where('equipement_id', 1)
                ->exists();

            if (!$clientExistant || !$parcelle1 || !$location1 || !$tracteur || !$associationTracteur) {
                throw new RuntimeException(
                    'Une donnée historique attendue est absente. Aucune modification validée.'
                );
            }

            if ((int) $location1->parcelle_id !== 1 || (int) $location1->client_id !== 1) {
                throw new RuntimeException('La location 1 ne correspond plus à la parcelle et au client 1.');
            }

            if ((int) $parcelle1->site_id !== (int) $sites->first()->id) {
                throw new RuntimeException('La parcelle 1 ne se trouve pas sur le premier site.');
            }

            // Compléter le client 1 sans écraser les champs déjà renseignés.
            DB::table('clients')->where('id', 1)->update([
                'nom' => $clientExistant->nom ?: 'Martin',
                'prenom' => $clientExistant->prenom ?: 'Alex',
                'email' => $clientExistant->email ?: 'alex.martin.demo@terramoi.test',
                'telephone' => $clientExistant->telephone ?: '0600000001',
                'adresse' => $clientExistant->adresse ?: '1 rue des Jardins, 94000 Créteil',
                'updated_at' => now(),
            ]);

            $noms = [
                ['Bernard', 'Camille'], ['Dubois', 'Thomas'],
                ['Thomas', 'Léa'], ['Robert', 'Hugo'],
                ['Richard', 'Emma'], ['Petit', 'Louis'],
                ['Durand', 'Chloé'], ['Leroy', 'Nathan'],
                ['Moreau', 'Inès'], ['Simon', 'Jules'],
                ['Laurent', 'Manon'], ['Lefebvre', 'Gabriel'],
                ['Michel', 'Sarah'], ['Garcia', 'Adam'],
                ['David', 'Jade'], ['Bertrand', 'Noah'],
                ['Roux', 'Zoé'], ['Vincent', 'Paul'],
                ['Fournier', 'Alice'], ['Morel', 'Ethan'],
                ['Girard', 'Lina'], ['André', 'Raphaël'],
                ['Lefèvre', 'Nina'], ['Mercier', 'Malo'],
                ['Dupont', 'Louise'], ['Lambert', 'Sacha'],
                ['Bonnet', 'Mila'], ['François', 'Léo'],
                ['Martinez', 'Eva'], ['Legrand', 'Noé'],
                ['Garnier', 'Anna'], ['Faure', 'Mathis'],
                ['Rousseau', 'Rose'], ['Blanc', 'Yanis'],
                ['Guérin', 'Lola'], ['Muller', 'Enzo'],
                ['Henry', 'Aya'], ['Roussel', 'Ilyes'],
                ['Nicolas', 'Clara'],
            ];

            // Les adresses de démonstration sont déterministes et réutilisables.
            foreach ($noms as $index => [$nom, $prenom]) {
                $numero = $index + 2;
                $email = sprintf('client%02d.demo@terramoi.test', $numero);
                $existe = DB::table('clients')->where('email', $email)->first();

                $donnees = [
                    'nom' => $nom,
                    'prenom' => $prenom,
                    'telephone' => sprintf('060000%04d', $numero),
                    'adresse' => sprintf('%d rue des Jardins, 94000 Créteil', $numero),
                    'updated_at' => now(),
                ];

                if ($existe) {
                    DB::table('clients')->where('id', $existe->id)->update($donnees);
                } else {
                    DB::table('clients')->insert($donnees + [
                        'email' => $email,
                        'created_at' => now(),
                    ]);
                }
            }

            $clients = DB::table('clients')->orderBy('id')->get();

            if ($clients->count() !== 40) {
                throw new RuntimeException(
                    'Le nombre de clients n’est pas exactement 40. Vérifie les clients préexistants.'
                );
            }

            // Ajouter ou mettre à jour les équipements sans remplacer le tracteur.
            $tarifs = [
                'Serre' => 15,
                'Kit outils' => 5,
                "Récupérateur d'eau" => 5,
                'Composteur' => 3,
            ];

            foreach ($tarifs as $libelle => $tarif) {
                $existe = DB::table('equipements')->where('libelle', $libelle)->first();

                if ($existe) {
                    DB::table('equipements')->where('id', $existe->id)->update([
                        'tarif_mensuel' => $tarif,
                        'updated_at' => now(),
                    ]);
                } else {
                    DB::table('equipements')->insert([
                        'libelle' => $libelle,
                        'tarif_mensuel' => $tarif,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }

            $idsEquipements = DB::table('equipements')
                ->whereIn('libelle', array_keys($tarifs))
                ->pluck('id', 'libelle');

            if ($idsEquipements->count() !== 4) {
                throw new RuntimeException('Les quatre équipements attendus sont introuvables.');
            }

            // Construire les sélections avant toute suppression.
            $selections = [];
            $idsAConserver = [];

            foreach ($sites as $index => $site) {
                $parcelles = DB::table('parcelles')
                    ->where('site_id', $site->id)
                    ->orderBy('id')
                    ->get();

                if ($parcelles->count() < $repartition[$index]) {
                    throw new RuntimeException("Pas assez de parcelles sur le site {$site->id}.");
                }

                $selection = collect();

                // La parcelle 1 est impérativement conservée.
                if ($index === 0) {
                    $selection->push($parcelles->firstWhere('id', 1));
                }

                foreach ($parcelles as $parcelle) {
                    if ($selection->count() >= $repartition[$index]) {
                        break;
                    }

                    if (!$selection->contains('id', $parcelle->id)) {
                        $selection->push($parcelle);
                    }
                }

                if ($selection->count() !== $repartition[$index]) {
                    throw new RuntimeException('Impossible de construire la répartition demandée.');
                }

                $selections[$site->id] = $selection->values();
                $idsAConserver = array_merge($idsAConserver, $selection->pluck('id')->all());

                // Refuser toute suppression d'une parcelle encore liée à une location.
                $idsSupprimes = $parcelles->pluck('id')->diff($selection->pluck('id'));

                if (DB::table('locations')->whereIn('parcelle_id', $idsSupprimes)->exists()) {
                    throw new RuntimeException(
                        "Une parcelle à supprimer sur le site {$site->id} possède une location."
                    );
                }
            }

            // Répartir les statuts et les types sans modifier le type historique de la parcelle 1.
            foreach ($sites as $index => $site) {
                foreach ($selections[$site->id] as $position => $parcelle) {
                    $statut = $position < $loueesParSite[$index] ? 'Louée' : 'Disponible';

                    $modifications = [
                        'statut' => $statut,
                        'updated_at' => now(),
                    ];

                    if ((int) $parcelle->id !== 1) {
                        $modifications['type_parcelle_id'] =
                            $types[$position % $types->count()];
                    }

                    DB::table('parcelles')->where('id', $parcelle->id)->update($modifications);
                }
            }

            // Supprimer seulement les parcelles excédentaires vérifiées ci-dessus.
            DB::table('parcelles')->whereNotIn('id', $idsAConserver)->delete();

            if (DB::table('parcelles')->count() !== 100) {
                throw new RuntimeException('Le total des parcelles après réduction n’est pas 100.');
            }

            // Créer une location pour chaque parcelle louée qui n'en possède pas.
            $parcellesLouees = DB::table('parcelles')
                ->where('statut', 'Louée')
                ->orderBy('id')
                ->get();

            foreach ($parcellesLouees as $parcelle) {
                $location = DB::table('locations')
                    ->where('parcelle_id', $parcelle->id)
                    ->first();

                if (!$location) {
                    $client = $clients[((int) $parcelle->id - 1) % $clients->count()];

                    $locationId = DB::table('locations')->insertGetId([
                        'date' => now()->toDateString(),
                        'date_location' => now()->toDateString(),
                        'date_paiement' => null,
                        'client_id' => $client->id,
                        'parcelle_id' => $parcelle->id,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);

                    // Équipements pour les nouvelles locations.
                    $choix = $idsEquipements->values()->all();
                    $nombre = 2 + ((int) $parcelle->id % 3);

                    foreach (array_slice($choix, 0, $nombre) as $equipementId) {
                        DB::table('location_equipement')->insertOrIgnore([
                            'location_id' => $locationId,
                            'equipement_id' => $equipementId,
                            'created_at' => now(),
                            'updated_at' => now(),
                        ]);
                    }
                }
            }

            // Garder le tracteur de la location 1 et ajouter des équipements sans supprimer l'existant.
            foreach (['Serre', 'Kit outils'] as $libelle) {
                DB::table('location_equipement')->insertOrIgnore([
                    'location_id' => 1,
                    'equipement_id' => $idsEquipements[$libelle],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            // Équipements collectifs par site.
            $collectifs = [
                'Point d’eau' => 4,
                'Local à outils' => 2,
                'Composteur collectif' => 3,
                'Parking voiture' => 1,
            ];

            foreach ($sites as $site) {
                foreach ($collectifs as $libelle => $nombre) {
                    for ($i = 1; $i <= $nombre; $i++) {
                        $nom = "{$libelle} {$i}";
                        $existe = DB::table('equipement_sites')
                            ->where('site_id', $site->id)
                            ->where('libelle', $nom)
                            ->exists();

                        if (!$existe) {
                            DB::table('equipement_sites')->insert([
                                'site_id' => $site->id,
                                'libelle' => $nom,
                                'created_at' => now(),
                                'updated_at' => now(),
                            ]);
                        }
                    }
                }
            }

            // Services : préserver la prestation historique « Étude ».
            $services = [
                'Débroussaillage' => 30,
                'Arrosage de la parcelle' => 15,
                'Bêchage' => 40,
                'Retrait des mauvaises herbes' => 25,
            ];

            foreach ($services as $type => $prix) {
                $consultation = "Prestation demandée : {$type}";
                $demande = DB::table('demandes')
                    ->where('client_id', 1)
                    ->where('consultation', $consultation)
                    ->first();

                if (!$demande) {
                    $demandeId = DB::table('demandes')->insertGetId([
                        'client_id' => 1,
                        'consultation' => $consultation,
                        'statut' => 'Nouvelle demande',
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                } else {
                    $demandeId = $demande->id;
                }

                $prestation = DB::table('prestations')
                    ->where('demande_id', $demandeId)
                    ->where('type', $type)
                    ->first();

                if ($prestation) {
                    DB::table('prestations')->where('id', $prestation->id)->update([
                        'prix' => $prix,
                        'updated_at' => now(),
                    ]);
                } else {
                    DB::table('prestations')->insert([
                        'demande_id' => $demandeId,
                        'type' => $type,
                        'prix' => $prix,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }

            // Contrôles finaux : tout échec annule la transaction.
            $louees = DB::table('parcelles')->where('statut', 'Louée')->count();
            $disponibles = DB::table('parcelles')->where('statut', 'Disponible')->count();
            $locations = DB::table('locations')->count();

            if ($louees !== 60 || $disponibles !== 40 || $locations !== 60) {
                throw new RuntimeException(
                    "Contrôle final invalide : {$louees} louées, {$disponibles} disponibles, {$locations} locations."
                );
            }

            $doublons = DB::table('locations')
                ->select('parcelle_id')
                ->groupBy('parcelle_id')
                ->havingRaw('COUNT(*) > 1')
                ->exists();

            if ($doublons) {
                throw new RuntimeException('Plusieurs locations existent pour une même parcelle.');
            }

            if (!DB::table('location_equipement')
                ->where('location_id', 1)
                ->where('equipement_id', 1)
                ->exists()) {
                throw new RuntimeException('L’association du tracteur à la location 1 a disparu.');
            }

            if (!DB::table('prestations')->where('id', 1)->where('type', 'Étude')->exists()) {
                throw new RuntimeException('La prestation historique Étude doit être conservée.');
            }

            if (DB::table('demandes')->where('client_id', 1)->count() < 2) {
                throw new RuntimeException('Les demandes historiques du client 1 doivent être conservées.');
            }
        });
    }
}
