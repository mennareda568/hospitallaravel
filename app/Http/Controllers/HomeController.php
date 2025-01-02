<?php
namespace App\Http\Controllers;

use App\Model\Department;
use App\Model\Doctor;
use App\Model\Patientbooking;
use App\User;
use App\Model\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class HomeController extends Controller
{

    //home page
    public function index()
    {
        $patibook = Patientbooking::count();
        $doctors = Doctor::count();
        $department = Department::count();

        return view('home', [
            "countpatibook" => $patibook,
            "countdoctors" => $doctors,
            "countdepart" => $department,
        ]);
    }


    //show appointments for doctor
    public function myapp(Request $request)
    {
        $data = Patientbooking::userData2()->get();
        return view('myappointment', compact('data'));
    }


    //create user for admin
    public function create()
    {
        return view('user/create');
    }

    //savecreate user for admin
    public function save(Request $item)
    {
        $item->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
            'role' => 'required',
        ]);
       
        User::create([
            "name" => $item->name,
            "email" => $item->email,
            'password' => Hash::make($item['password']),
            "role" => $item->role,
        ]);

            $newAdmins = User::where('role', 'admin')
            ->whereNotIn('email', Admin::pluck('email'))
            ->get();
            foreach ($newAdmins as $admin) {
                Admin::create([
                    'id' => $admin->id,
                    'name' => $admin->name,
                    'email' => $admin->email,
                ]);
                return redirect()->route('admin')->with("message", "Created Successfully");

            }

            $newDoctors = User::where('role', 'doctor')
            ->whereNotIn('email', Doctor::pluck('email'))
            ->get();
            foreach ($newDoctors as $doctor) {
                Doctor::create([
                    'id' => $doctor->id,
                    'name' => $doctor->name,
                    'email' => $doctor->email,
                ]);
                return redirect()->route('doctor')->with("message", "Created Successfully");
            }
    }

}


