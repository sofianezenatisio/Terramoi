
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('location_equipement', function (Blueprint $table) {
            $table->id();

            $table->foreignId('location_id')
                ->constrained('locations')
                ->cascadeOnDelete();

            $table->foreignId('equipement_id')
                ->constrained('equipements')
                ->restrictOnDelete();

            $table->timestamps();

            $table->unique(['location_id', 'equipement_id']);
        });

        // Conserver les associations existantes.
        $locations = DB::table('locations')
            ->whereNotNull('equipement_id')
            ->get(['id', 'equipement_id']);

        foreach ($locations as $location) {
            DB::table('location_equipement')->insert([
                'location_id' => $location->id,
                'equipement_id' => $location->equipement_id,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        Schema::table('locations', function (Blueprint $table) {
            $table->dropForeign(['equipement_id']);
            $table->dropColumn('equipement_id');
        });
    }

    public function down(): void
    {
        Schema::table('locations', function (Blueprint $table) {
            $table->foreignId('equipement_id')
                ->nullable()
                ->constrained('equipements')
                ->restrictOnDelete();
        });

        // Restaurer un équipement par location en cas de rollback.
        $associations = DB::table('location_equipement')
            ->orderBy('id')
            ->get(['location_id', 'equipement_id']);

        foreach ($associations as $association) {
            DB::table('locations')
                ->where('id', $association->location_id)
                ->whereNull('equipement_id')
                ->update([
                    'equipement_id' => $association->equipement_id,
                ]);
        }

        Schema::dropIfExists('location_equipement');
    }
};
