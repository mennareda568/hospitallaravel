<?php
namespace App\Http\Controllers;

use App\User;
use App\Model\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class AdminController extends Controller
{
  
    public function index()
    {
        $admins = Admin::count();
        $data = Admin::paginate(4); 
        return view('admin', compact('data','admins'));
    }

    public function show($id)
    {
        $admin = Admin::findOrFail($id);
        return view('admin/show', ["result" => $admin]);
    }

    public function delete($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        $admin = Admin::findOrFail($id);
        $admin->delete();
        return redirect()->route('admin')->with("message", "deleted successfully");
    }


    public function edit($id)
    {
        $admin = Admin::findOrFail($id);
        return view("admin/edit", ["result" => $admin]);
    }

    public function saveedit(Request $request)
    {
        $old_id = $request->old_id;
        $admin = Admin::findOrFail($old_id);
        $user = User::findOrFail($old_id);

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$user->id,
            'password' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'gender' => 'required',
        ]);

        $admin->update([
            "name" => $request->name,
            "email" => $request->email,
            'password' => Hash::make($request['password']),
            "address" => $request->address,
            "gender" => $request->gender,
            "phone" => $request->phone,
        ]);

        $user->update([
            "name" => $request->name,
            "email" => $request->email,
            'password' => Hash::make($request['password']),
        ]);
        return redirect()->route("admin")->with("message", "edited successfully");
    }
}
