<?php
namespace App\Http\Controllers;
use App\Model\Patientbooking;
use Illuminate\Http\Request;


class AllbookingController extends Controller
{

    public function index()
    {
        $patibook = Patientbooking::count();
        $booking =   Patientbooking::all();  
        return view('allbooking', [
            "countpatibook" => $patibook,
            "patientbook"=> $booking,
        ]);
    }
}
