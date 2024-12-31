<?php
namespace App\Http\Controllers;

use App\Model\Department;
use App\Model\Doctor;
use App\Model\Patientbooking;
use App\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{


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


    public function myapp(Request $request)
    {
        $data = Patientbooking::userData2()->get();
        return view('myappointment', compact('data'));
    }

    public function show()
    {
        $user = User::paginate(5);
        return view('user', [
            "result" => $user,
        ]);
    }

    public function delete($id)
    {
        $admin = User::findOrFail($id);
        $admin->delete();
        return redirect()->route('user')->with("message", "deleted successfully");
    }


    public function search(Request $request)
    {
        $search = $request->get('search');
        $users = User::when($search, function ($sql) use ($search) {
            $sql->where('name', 'like', '%' . $search . '%');
        })
            ->paginate(5);

        return view('usersearch',  [
            "data" => $users,
        ]);
    }
}
