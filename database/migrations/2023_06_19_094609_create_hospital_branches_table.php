<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hospital_branches', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string("slug")->unique();
            $table->string("email");
            $table->string("web");
            $table->text("description");
            $table->boolean("status")->default(true);
            $table->unsignedBigInteger("last_edit_by");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hospital_branches');
    }
};
