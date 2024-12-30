# Smart Hospitals (Hospital Management System)
This is a hospital management system written in php(Laravel)

## This has the following features
* Appointments Managment
    * Book,view and delete appointments
* Patients Managment
    * Manage patients information,medical history.
* Doctor Managment
    * Manage doctors profiles and their schedules  
* User Roles and Permissions: Define roles and permissions for different types of users such as admin,doctor and patient.
    

* User Role Based Access Control
    * Admin
    * Doctor
    * Patient
* Login Details for Admin :
email : admin@gmail.com
Password : 12345678

* Login Details for Doctor :
email : doctor@gmail.com
Password : 12345678

* Login Details for Patient :
email : patient@gmail.com
Password : 12345678

 
# Installation Guide
    1)Install Composer In Your PC
    
    2)Clone Or Download The Repository
    
    3)Goto The Repository and Open a Terminal Enter Following Commands 
        composer install
    
    4)Add the .env File(You Can Find It In The Internet)
    
    5)Set the .env File with the relevant configuration
    
    6)Execute the Following Command
        php artisan generate:key
        php artisan migrate
        php artisan serve
        php artisan db:hospital
    

# Note

Every Time You Make A Change To The Database Do The Change In The Migrations(Not Directly To The Real Database)






































