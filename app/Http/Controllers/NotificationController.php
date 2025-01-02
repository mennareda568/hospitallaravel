<?php

namespace App\Http\Controllers;

use App\Model\Notification;



class NotificationController extends Controller
{

    public function index()
    {
        $all = Notification::count();
        $notification= Notification::paginate(2);
        return view('notification',  [
            "result" => $notification,
            "data" => $all,
        ]);
    }
}
