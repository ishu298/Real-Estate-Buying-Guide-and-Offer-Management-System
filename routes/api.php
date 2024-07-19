<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\CountController;
use App\Http\Controllers\API\TagController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\PostController;
use App\Http\Controllers\API\ReactApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('acquire-lists', [ReactApiController::class, 'acquire_list']);
Route::get('generateInvoicePdf', [ReactApiController::class, 'generateInvoicePdf']);
Route::get('art-lists', [ReactApiController::class, 'art_list']);
Route::get('aware-lists', [ReactApiController::class, 'aware_list']);
Route::post('get-acquire-by-id', [ReactApiController::class, 'get_acquire_by_id']);
Route::post('add-adorn-form', [ReactApiController::class, 'addAdornForm']);
Route::post('get-products-by-ids', [ReactApiController::class, 'getProductsByIds']);
Route::post('add-contact-form', [ReactApiController::class, 'addContactForm']);
Route::post('add-newsletter-form', [ReactApiController::class, 'addNewsletterForm']);
Route::post('order-generate', [ReactApiController::class, 'generateOrder']);
Route::post('my-order', [ReactApiController::class, 'myOrders']);
Route::post('save-enquire-form', [ReactApiController::class, 'saveEnquireForm']);
Route::post('create-checkout-session', [ReactApiController::class, 'create_checkout_session']);
Route::match(['get', 'post'], 'success_payment', [ReactApiController::class, 'success_payment']);
Route::post('cancel_payment', [ReactApiController::class, 'cancel_payment']);
Route::post('get-order-by-id', [ReactApiController::class, 'getOrderById']);
Route::POST('aware-detail-page', [ReactApiController::class, 'aware_detail_page']);

Route::post('stripe/webhook', [ReactApiController::class, 'stripeWebhook']);
Route::get('getFooterData', [ReactApiController::class, 'getFooterData']);
Route::get('openpdf', [ReactApiController::class, 'openpdf']);

// Normal Routes
Route::get('posts', [PostController::class, 'index']);
Route::get('popular-posts', [PostController::class, 'popular']);
Route::get('categories', [CategoryController::class, 'index']);
Route::get('tags', [TagController::class, 'index']);
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::get('counts', [CountController::class, 'index']);
Route::get('/category/{category}', [CategoryController::class, 'postByCategory'])->name('category');
Route::get('/tag/{tag}', [TagController::class, 'postByTag'])->name('tag');


// Secure/Token Routes
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('add-tags', [TagController::class, 'addTags']);
    Route::post('update-tags', [TagController::class, 'updateTags']);
    Route::post('delete-tags/{id}', [TagController::class, 'deleteTags']);
    Route::post('add-categories', [CategoryController::class, 'addCategories']);
    Route::post('update-categories', [CategoryController::class, 'updateCategories']);
    Route::post('delete-categories/{id}', [CategoryController::class, 'deleteCategories']);
   
    Route::post('add-posts', [PostController::class, 'addPosts']);
    Route::post('update-posts', [PostController::class, 'updatePosts']);
    Route::post('delete-posts/{id}', [PostController::class, 'deletePosts']);
// });


//Protecting Routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function (Request $request) {
        return auth()->user();
    });

    // API route for logout user
    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::get('/index', [AuthController::class, 'index']);
Route::post('/save', [AuthController::class, 'save']);
Route::get('/edit/{id}', [AuthController::class, 'edit']);
Route::put('/update/{id}', [AuthController::class, 'update']);
Route::get('/delete/{id}', [AuthController::class, 'delete']);




