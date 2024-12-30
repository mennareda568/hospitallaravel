<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']
    ],
    function () {

        Route::get('/', function () {
            return view('welcome');
        })->name("welcome"); 
        Route::post('/message', 'MessageController@store')->name('storemsg');
        
        Auth::routes();

        //(home route)  
        Route::group(
            ['middleware' => 'CheckUser'],
            function () {
                Route::get('/home', 'HomeController@index')->name('home');               
            }
        );

        //(admins routes)
        Route::group(
            ['middleware' => 'CheckAdmin'],
            function () {

                Route::get('/allbooking', 'AllbookingController@index')->name('allbooking');               
                //admins table  
                Route::get('/admin', 'AdminController@index')->name('admin');  
                Route::get('/admin/show/{id}', 'AdminController@show')->name('showadmin');
                Route::get('/admin/edit/{id}', 'AdminController@edit')->name('editadmin');
                Route::post('/admin/update', 'AdminController@saveedit')->name('updateadmin');
                Route::get('/admin/delete/{id}', 'AdminController@delete')->name('deleteadmin');
                Route::get('/admin/create', 'AdminController@create')->name('createadmin');
                Route::post('/admin/save', 'AdminController@savenew')->name('saveadmin');

                //users table  
                Route::get('/user', 'HomeController@show')->name('user');  
                Route::get('/user/delete/{id}', 'HomeController@delete')->name('deleteuser');
                Route::get('/searchuser', 'HomeController@search')->name('searchuser');

                //departments table  
                Route::get('/department', 'DepartmentController@index')->name('department'); 
                Route::get('/department/edit/{id}', 'DepartmentController@edit')->name('editdepart');
                Route::post('/department/update', 'DepartmentController@saveedit')->name('updatedepart');
                Route::get('/department/delete/{id}', 'DepartmentController@delete')->name('deletedepart');
                Route::get('/department/create', 'DepartmentController@create')->name('createdepart');
                Route::post('/department/save', 'DepartmentController@savenew')->name('savedepart');

                //doctors table  
                Route::get('/doctor', 'DoctorController@getData')->name('doctor'); 
                Route::get('/doctor/show/{id}', 'DoctorController@show')->name('showdoctor');
                Route::get('/doctor/delete/{id}', 'DoctorController@delete')->name('deletedoctor');
                Route::get('/doctor/create', 'DoctorController@create')->name('createdoctor');
                Route::post('/doctor/save', 'DoctorController@savenew')->name('savedoctor');
                Route::get('/doctor/edit/{id}', 'DoctorController@edit')->name('editdoctor');
                Route::post('/doctor/update', 'DoctorController@saveedit')->name('updatedoctor');
                Route::get('/searchdoctor', 'DoctorController@search')->name('searchdoc');

                // messages table  
                Route::get('/messages', 'MessageController@index')->name('message');
                Route::get('/msg/delete/{id}', 'MessageController@delete')->name('deletemsg');
            }
        );

        //(doctors routes)  
        Route::group(
            ['middleware' => 'CheckDoctor'],
            function () { 

                //appointment table  
                Route::get('/myappointment', 'HomeController@myapp')->name('myapp');             
                //patients table  
                Route::get('/mypatients', 'PatientController@index')->name('patient'); 
                Route::get('/patients/delete/{id}', 'PatientController@delete')->name('deletepatient');
                Route::get('/patients/create', 'PatientController@create')->name('createpatient');
                Route::post('/patients/save', 'PatientController@savenew')->name('savepatient');
                Route::get('/patients/edit/{id}', 'PatientController@edit')->name('editpatient');
                Route::post('/patients/update', 'PatientController@saveedit')->name('updatepatients');
                Route::get('/searchpatient', 'PatientController@search')->name('searchpatient');
            }
        );
 
        //(patients routes) 
        Route::group(
            ['middleware' => 'CheckPatient'],
            function () {
                //doctorstable   
                Route::get('/doctorlist', 'DoctorController@showlist')->name('doctorlist');
                Route::get('/searchlist', 'DoctorController@searchlist')->name('searchlist');

                //patientbooking 
                Route::get('/mybooking', 'PatientbookingController@index')->name('relation');
                Route::get('/doctor/book/{id}', 'PatientbookingController@book')->name('bookappoint');
                Route::post('/doctor/savebook', 'PatientbookingController@savebook')->name('savebooking'); 
                Route::get('/booking/edit/{id}', 'PatientbookingController@edit')->name('editbook');
                Route::post('/booking/update', 'PatientbookingController@saveedit')->name('updatebook');
                Route::get('/booking/delete/{id}', 'PatientbookingController@delete')->name('deletebook');

            }
        ); 
    }
);
