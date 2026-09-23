<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('parcelles', function (Blueprint $table) {
            $table->id();

            $table->foreignId('site_id')
                ->constrained('sites')
                ->cascadeOnDelete();

            $table->foreignId('type_parcelle_id')
                ->constrained('type_parcelles')
                ->cascadeOnDelete();

            $table->string('statut');

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('parcelles');
    }
};
