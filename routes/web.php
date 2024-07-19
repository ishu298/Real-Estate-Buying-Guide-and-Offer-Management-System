<?php

use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CountController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\Admin\LessonController;
use App\Http\Controllers\Admin\PropertyController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return view('dashboard');
// })->name('dashboard');

Route::middleware(['auth'])->group(function () {
    // Define your authenticated routes here
    Route::get('/dashboard', [CountController::class, 'index'])->name('dashboard');
    // Other authenticated routes...
});


Route::get('/', function () {
    return view('auth.login');
});








// Users 
Route::name('admin.')->middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::get('/user/list', [UserController::class, 'list'])->name('user_list');
    Route::get('/user/add', [UserController::class, 'add'])->name('add_user');
    Route::post('/user/store', [UserController::class, 'store'])->name('store_user');
    Route::get('/user/edit/{id}', [UserController::class, 'edit'])->name('edit_user');
    Route::get('/user/delete/{id}', [UserController::class, 'destroy'])->name('delete_user');
    Route::get('/lessons/list', [LessonController::class, 'index'])->name('lesson_list');
    Route::get('/lessons/add/{id?}', [LessonController::class, 'create'])->name('lesson_add');
    Route::post('/lessons/store', [LessonController::class, 'store'])->name('lesson_store');
    Route::get('/lessons/delete/{id}', [LessonController::class, 'delete'])->name('lesson_delete');
    Route::get('/property/list', [PropertyController::class, 'index'])->name('property_list');
    Route::get('/property/add/{id?}', [PropertyController::class, 'create'])->name('property_add');
    Route::post('/property/store', [PropertyController::class, 'store'])->name('property_store');
    Route::get('/property/delete/{id}', [PropertyController::class, 'delete'])->name('property_delete');






});
Route::post('/user/update', [UserController::class, 'update'])->name('update_user');



Route::get('/test_email', function () {
    try {  
    Mail::raw('Hello World!', function ($msg) {
        $msg->to('ashishtomar.liangtuang@gmail.com')->subject('Test Email');
    });
    } catch (\Exception $e) {
    Log::error('SES API request failed: ' . $e->getMessage());
    Log::error('Stack trace: ' . $e->getTraceAsString());
    }
    dd('mail has been sent.');
});

// Requests
Route::name('admin.')->middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::get('/request/contact', [UserController::class, 'contact_list'])->name('contact_list');
    Route::get('/request/contact_all_reply/{id}', [UserController::class, 'contact_all_reply'])->name('contact_all_reply');
    Route::get('/request/enquire_all_reply/{id}', [UserController::class, 'enquire_all_reply'])->name('enquire_all_reply');
    Route::get('/request/enquire', [UserController::class, 'enquire_list'])->name('enquire_list');
    Route::get('request/contact/delete/{id}', [UserController::class, 'delete_contact'])->name('delete_contact');
    Route::get('request/contactReply/delete/{id}/{contact_id}', [UserController::class, 'delete_contact_reply'])->name('delete_contact_reply');
    Route::get('request/enquireReply/delete/{id}/{contact_id}', [UserController::class, 'delete_enquire_reply'])->name('delete_enquire_reply');
    Route::get('request/enquire/delete/{id}', [UserController::class, 'delete_enquire'])->name('delete_enquire');
    Route::get('request/enquire/detail/{id}', [UserController::class, 'enquire_detail'])->name('enquire_detail');
    Route::get('request/contact/detail/{id}', [UserController::class, 'contact_detail'])->name('contact_detail');
    Route::post('request/contact_reply', [UserController::class, 'send_contact_reply'])->name('send_contact_reply');
    Route::post('request/enquire_reply', [UserController::class, 'send_enquire_reply'])->name('send_enquire_reply');
    Route::get('manage-about-us', [UserController::class, 'manage_about_us'])->name('manage_about_us');
    Route::post('add_n_update_about_us', [UserController::class, 'add_n_update_about_us'])->name('add_n_update_about_us');
    Route::post('add_n_update_about_us_image', [UserController::class, 'add_n_update_about_us_image'])->name('add_n_update_about_us_image');
    
    Route::post('add_n_update_adorn_description', [UserController::class, 'add_n_update_adorn_description'])->name('add_n_update_adorn_description');
    Route::post('add_n_update_acquire_description', [UserController::class, 'add_n_update_acquire_description'])->name('add_n_update_acquire_description');
    Route::post('add_n_update_art_description', [UserController::class, 'add_n_update_art_description'])->name('add_n_update_art_description');
    Route::post('add_n_update_contact_description', [UserController::class, 'add_n_update_contact_description'])->name('add_n_update_contact_description');
    Route::get('theme-setting', [UserController::class, 'theme_setting'])->name('theme_setting');
    Route::post('update_theme_setting', [UserController::class, 'update_theme_setting'])->name('update_theme_setting');
    
    

    Route::post('store_contact_info', [UserController::class, 'store_contact_info'])->name('store_contact_info');
    Route::get('manage-contact-info', [UserController::class, 'manage_contact_info'])->name('manage_contact_info');
    Route::get('manage-privacy-policy', [UserController::class, 'manage_privacy_policy'])->name('manage_privacy_policy');
    Route::post('add_n_update_privacy_policy', [UserController::class, 'add_n_update_privacy_policy'])->name('add_n_update_privacy_policy');

    Route::get('terms-conditions', [UserController::class, 'terms_conditions'])->name('terms_conditions');
    Route::post('add_n_update_terms_conditions', [UserController::class, 'add_n_update_terms_conditions'])->name('add_n_update_terms_conditions');
    Route::get('newsletter', [UserController::class, 'newsletter'])->name('newsletter');
    Route::get('delete-newsletter/{id}', [UserController::class, 'delete_newsletter'])->name('delete_newsletter');
    Route::get('manage-email-template', [UserController::class, 'manage_email_template'])->name('manage_email_template');
    Route::get('edit-email-template/{id}', [UserController::class, 'edit_email_template'])->name('edit_email_template');
    Route::post('update_email_template', [UserController::class, 'update_email_template'])->name('update_email_template');
    Route::get('delete-email-template/{id}', [UserController::class, 'delete_email_template'])->name('delete_email_template');

    Route::get('manage-website-setting', [UserController::class, 'manage_website_setting'])->name('manage_website_setting');
    Route::post('update_footer_text', [UserController::class, 'update_footer_text'])->name('update_footer_text');
    Route::post('add_n_update_art_wydouse', [UserController::class, 'add_n_update_art_wydouse'])->name('add_n_update_art_wydouse');
    

    

});


