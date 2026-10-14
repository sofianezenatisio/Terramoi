
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('clients', function (Blueprint $table) {
            $table->string('nom')->nullable();
            $table->string('prenom')->nullable();
            $table->string('email')->nullable()->unique();
            $table->string('telephone')->nullable();
            $table->string('adresse')->nullable();
        });

        Schema::table('equipements', function (Blueprint $table) {
            $table->decimal('tarif_mensuel', 8, 2)->default(0);
        });

        Schema::table('demandes', function (Blueprint $table) {
            $table->string('statut')
                ->default('Nouvelle demande');
        });
    }

    public function down(): void
    {
        Schema::table('demandes', function (Blueprint $table) {
            $table->dropColumn('statut');
        });

        Schema::table('equipements', function (Blueprint $table) {
            $table->dropColumn('tarif_mensuel');
        });

        Schema::table('clients', function (Blueprint $table) {
            $table->dropUnique(['email']);
            $table->dropColumn([
                'nom',
                'prenom',
                'email',
                'telephone',
                'adresse',
            ]);
        });
    }
};
