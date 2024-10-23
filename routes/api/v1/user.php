<?php

use App\Http\Controllers\Api\V1\User\BranchController;
use App\Http\Controllers\Api\V1\User\HealthPackageController;
use App\Http\Controllers\Api\V1\User\InvestigationController;
use App\Http\Controllers\Api\V1\User\ProfileController;
use Illuminate\Support\Facades\Route;

Route::prefix("user")->name("api.user.")->group(function(){

    Route::controller(ProfileController::class)->prefix('profile')->group(function(){
        Route::get('info','profileInfo');
        Route::post('info/update','profileInfoUpdate')->middleware(['app.mode']);
        Route::post('password/update','profilePasswordUpdate')->middleware(['app.mode']);
    });

    // Logout Route
    Route::post('logout',[ProfileController::class,'logout']);

    //Investigation Controller

    Route::controller(InvestigationController::class)->group(function(){
        Route::get("investigation","investigation");
        Route::get("investigation/search","investigationSearch");
    });

    //health package

    Route::controller(HealthPackageController::class)->group(function(){
        Route::get("health/package","healthPackage");
        Route::get("health/package/search","healthPackageSearch");
    });

    //branch 

    Route::controller(BranchController::class)->group(function(){
        Route::get("branch","branch");
        route::get("branch/search","branchSearch");
    });

    //History

    Route::controller(ProfileController::class)->group(function(){
        Route::get("history","history");
        Route::get("home-service-history","homeServiceHistory");
    });

    
});

