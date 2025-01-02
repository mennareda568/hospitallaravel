<?php
namespace App\Http\Controllers;

use App\Model\Doctor;
use App\Model\Profile;
use App\Model\Patientbooking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PatientbookingController extends Controller
{
    //show booking table
    public function index(Request $request)
    {
        $data = Patientbooking::userData()->get();
        return view('mybooking', compact('data'));
    }

    //delete booking 
    public function delete($id)
    {
        $booking = Patientbooking::findOrFail($id);
        $booking->delete();
        return redirect()->route('relation')->with("message", "deleted successfully");
    }

    //update booking 
    public function edit($id)
    {
        $booking = Patientbooking::findOrFail($id);
        return view("patientbooking/edit", ["result" => $booking]);
    }

    //saveupdate booking 
    public function saveedit(Request $request)
    {
        $old_id = $request->old_id;
        $booking = Patientbooking::findOrFail($old_id);

        $request->validate([
            'patientname' => 'required',
            'patientage' => 'required|numeric|between:18,100',
            'patientphone' => 'required',
        ]);

        $booking->update([
            "days" => $request->days,
            "time" => $request->time,
            "patientname" => $request->patientname,
            "patientemail" => $request->patientemail,
            "patientphone" => $request->patientphone,
            "patientage" => $request->patientage,
        ]);
        return redirect()->route('relation')->with("message", "Updated Successfully");
    }

    //book new appointments 
    public function book($id)
    {
        $Doctor = Doctor::findOrFail($id);
        $doctorEmail=$Doctor->email;
        $bookingsCount = PatientBooking::where('doctoremail', $doctorEmail)
            ->count();
        if ($bookingsCount >= 3) {
            return redirect()->route('doctorlist')->with("message", "Doctor Has No Booking Available");
    
        } else {
            $id = Auth::user()->id;
            $profile = Profile::findOrFail($id);
            return view('patientbooking/create', ["result" => $Doctor],["data" => $profile]);
        }
    }

    //savebook new appointments 
    public function savebook(Request $item)
    {
        
        $item->validate([
            'patientname' => 'required',
            'patientage' => 'required|numeric|between:18,100',            
            'patientphone' => 'required',
        ]);

        Patientbooking::create([
            "doctor" => $item->doctor,
            "doctoremail" => $item->doctoremail,
            "department" => $item->department,
            "days" => $item->days,
            "time" => $item->time,
            "patientname" => $item->patientname,
            "patientemail" => $item->patientemail,
            "patientphone" => $item->patientphone,
            "patientage" => $item->patientage,
            "consultancyfees" => $item->consultancyfees,
        ]);
        return redirect()->route('relation')->with("message", "Booked Successfully");
    }

}

