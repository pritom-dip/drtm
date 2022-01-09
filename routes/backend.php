<?php
Route::prefix('/admin')->group(function () {

    Route::post('ckeditor/image_upload', 'CKEditorController@upload')->name('upload');
    // ---------------------- Admin Guard Routes -------------------------
    Route::get('/',                 'AdminController@dashboard')->name('admin.dashboard');
    Route::get('/login',                'Auth\Admin\AdminLoginController@showLoginForm')->name('admin.login');
    Route::post('/login/submit',        'Auth\Admin\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/logout',               'Auth\Admin\AdminLoginController@adminLogout')->name('admin.logout');

    // ------------------- guard/ Middleware admin --------------------------
    Route::group(['middleware' => ['auth:admin', 'permission']], function () {

        // ------------------------------- Admin Profile -------------------------------
        Route::get('profile/{admin}',          'AdminController@profileView')->name('admin.profile');
        Route::put('profile/{admin}',          'AdminController@updateProfile')->name('admin.updateprofile');

        // ------------------Backend all portion------------------
        Route::namespace('Backend')->group(function () {
            // ------------------Role------------------
            Route::resource('role',                 'RoleController');
            // ------------------Dominion------------------
            Route::resource('dominion',             'DominionController');
            // ------------------Process------------------
            Route::resource('process',              'ProcessController');
            // ------------------Permission------------------
            Route::resource('permission',           'PermissionController');
            Route::resource('menu',                 'MenuController');
            Route::post('menuprocess',              'MenuController@menuProcess')->name('menu.processondominion');

            Route::resource('service',              'ServiceController');
            Route::resource('team',                 'TeamController');
            Route::resource('project',              'ProjectController');
            Route::get('transactions',              'PaymentController@index')->name('payment.index');
            Route::get('show-transactions/{id}',    'PaymentController@show')->name('payment.show');
            Route::get('reports',                   'PaymentController@getReport')->name('payment.reports');
            Route::get('individual-report',           'PaymentController@reports')->name('payment.specific');


        });

        //------------------------------- Admin Crud -------------------------------
        Route::resource('admin',               'AdminController');
    });
});