<?php
namespace App\Http\Controllers;

use App\Model\Doctor;
use App\Model\Patientbooking;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;



class DoctorController extends Controller
{
    //  doctor table for admin
    public function index()
    {
        $doctors = Doctor::count();
        $Doctor = Doctor::paginate(3);
        return view('doctor', [
            "data" => $Doctor,
            "countdoctors" => $doctors,
        ]);
    }

    //  search doctor table for admin
    public function search(Request $request)
    {
        $search = $request->get('search');
        $doctors = Doctor::when($search, function ($sql) use ($search) {
            $sql->where('name', 'like', '%' . $search . '%');
        })
            ->paginate(5);

        return view('doctorsearch',  [
            "element" => $doctors,
        ]);
    }

    //  show page for admin
    public function show($id)
    {
        $Doctor = Doctor::findOrFail($id);
        return view('Doctor/show', ["result" => $Doctor]);
    }

    //  delete doctor for admin
    public function delete($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        $Doctor = Doctor::findOrFail($id);
        $Doctor->delete();
        return redirect()->route('doctor')->with("message", "deleted successfully");
    }



    //  update profile for doctor
    public function edit($id)
    {
        $Doctor = Doctor::findOrFail($id);
        return view("Doctor/edit",["result" => $Doctor]);
    }

 
    //  update profile for doctor
    public function saveedit(Request $request)
    {
        $old_id = $request->old_id;
        $user = User::findOrFail($old_id);
        $Doctor = Doctor::findOrFail($old_id);
        $docemail=$Doctor->email;
       
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$user->id,
            'doc_image' => 'max:2048|mimes:png,jpeg',
            'address' => 'required',
            'phone' => 'required',
            'department' => 'required',
            'age' => 'required',
            'gender' => 'required',
            'days' => 'required',
            'time' => 'required',
            'Consultancyfees' => 'required',
        ]);

        if ($request->hasFile("doc_image")) {
            $image = $request->doc_image;
            $imageName = time() . rand(1, 100) . "." . $image->extension();
            $image->move(public_path("img/doctors/"), $imageName);
   
        }else{
            $imageName= $Doctor->doc_image;
        }

        $Doctor->update([
            "name" => $request->name,
            "email" => $request->email,
            'password' => $request->password,
            "doc_image" => $imageName,
            "gender" => $request->gender,
            "address" => $request->address,
            "phone" => $request->phone,
            "department" => $request->department,
            "age" => $request->age,
            "days" => $request->days,
            "time" => $request->time,
            "Consultancyfees" => $request->Consultancyfees,
        ]);

        $user->update([
            "name" => $request->name,
            "email" => $request->email,
            'password' => $request->password,
        ]);
        
        PatientBooking::where('doctoremail', $docemail)
            ->update([
                "doctor" => $request->name,
                "department" => $request->department,
                'doctoremail' => $request->email,
                'days' => $request->days,
                'time' => $request->time,
                "Consultancyfees" => $request->Consultancyfees,
            ]);
        return redirect()->route("home")->with("messagedoc", "updated successfully");
    }

    //  change password for doctor
    public function password()
    {
        return view("Doctor/password");
    }
    //  change password for doctor
    public function pass(Request $request)
    {
        $old_id = $request->old_id;
        $Doctor = Doctor::findOrFail($old_id);
        $user = User::findOrFail($old_id);
        $request->validate([
            'password' => 'required',
        ]);
        $Doctor->update([
            'password' => Hash::make($request['password']),
        ]);

        $user->update([
            'password' => Hash::make($request['password']),
        ]);
        return redirect()->route("home")->with("messagedoc", "Your Password changed successfully");
    }


    
    // doctor list for patient
    public function showlist()
    {
        $patibook = Patientbooking::count();
        if ($patibook > 7) {
            return redirect()->route('home')->with("message", "No Doctors Available");
        } else {
        $Doctor = Doctor::paginate(1);
        return view('doctorlist', [
            "element" => $Doctor,
        ]);
        }
    }
    
    // doctor list search for patient
    public function searchlist(Request $request)
    {
        $patibook = Patientbooking::count();
        if ($patibook > 7) {
            return redirect()->route('home')->with("message", "No Doctors Available");
        } else {
        $search = $request->get('search');
        $doctors = Doctor::when($search, function ($sql) use ($search) {
            $sql->where('name', 'like', '%' . $search . '%');
        })
            ->paginate(1);

        return view('listsearch',  [
            "data" => $doctors,
        ]);
    }
    }
}
