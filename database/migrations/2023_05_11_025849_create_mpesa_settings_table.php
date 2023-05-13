<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mpesa_settings', function (Blueprint $table) {
            $table->id();
            $table->string('business_short_code')->nullable();
            $table->string('till_number')->nullable();
            $table->string('pass_key')->nullable();
            $table->string('consumer_key')->nullable();
            $table->string('consumer_secret')->nullable();
            $table->string('account_reference')->nullable();
            $table->integer('status');
            $table->string('mpesa_environment')->nullable();
            $table->string('sanbox_base_url')->nullable();
            $table->string('live_base_url')->nullable();
            $table->string('safaricom_passkey')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mpesa_settings');
    }
};
