<?php

namespace App\Http\Controllers;

use App\Model\Doctor;
use App\Model\Patientbooking;
use Illuminate\Http\Request;

class PatientbookingController extends Controller
{
    public function index(Request $request)
    {
        $data = Patientbooking::userData()->get();
        return view('mybooking', compact('data'));
    }

    public function delete($id)
    {
        $booking = Patientbooking::findOrFail($id);
        $booking->delete();
        return redirect()->route('relation')->with("message", "deleted successfully");
    }

    public function edit($id)
    {
        $booking = Patientbooking::findOrFail($id);
        return view("patientbooking/edit", ["result" => $booking]);
    }

    public function saveedit(Request $request)
    {
        $old_id = $request->old_id;
        $booking = Patientbooking::findOrFail($old_id);

        $request->validate([
            'patientname' => 'required',
            'patientage' => 'required',
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

    public function book($id)
    {
        $patibook = Patientbooking::count();
        if ($patibook > 4) {
            return redirect()->route('doctorlist')->with("message", "No Booking Available");
        } else {
            $Doctor = Doctor::findOrFail($id);
            return view('patientbooking/create', ["result" => $Doctor]);
        }
    }

    public function savebook(Request $item)
    {
        $item->validate([
            'patientname' => 'required',
            'patientage' => 'required',
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
