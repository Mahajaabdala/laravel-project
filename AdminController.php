<?php

namespace App\Http\Controllers;
use App\Models\transit;
use App\Models\imports;
use App\Models\shipment;
use App\Models\Reminder;
use App\Models\booking;
use App\Models\transport;
use App\Models\shipping;
use App\Models\shiping;
use Illuminate\Http\Request;
use App\Models\user;
use Hash;
class AdminController extends Controller
{

    public function dashboard()
    {
        // Fetch counts from each table
        $transitCount = transit::count();
        $importsCount = Imports::count();
        $shipmentCount = Shipment::count();
        $reminderCount = Reminder::count();
        $bookingCount = Booking::count();
        $transportCount = Transport::count();
        $shippingCount = Shipping::count();
    
        // Pass counts to the view
        return view('admin.dashboard', compact('transitCount', 'importsCount', 'shipmentCount', 'reminderCount', 'bookingCount', 'transportCount', 'shippingCount'));
    }

   // dd(compact('transitCount', 'importsCount', 'shipmentCount', 'reminderCount', 'bookingCount', 'transportCount', 'shippingCount'));


public function list()
    {
        $data['getRecord'] = User::getAdmin();
        $data['header_title'] = "Admin List";
        return view('admin.admin.list',$data);
    }

public function add()
    {
        $data['header_title'] = "Add new Admin";
        return view('admin.admin.add',$data);
    }

public function insert(Request $request)
    {
        request()->validate([
            'email' => 'required|email|unique:users'
        ]);
        
        $user = new User;
        $user->name = trim($request->name);
        $user->email = trim($request->email);
        $user->password = Hash::make($request->password);
        $user->user_type = 1;
        $user->save();

        return redirect('admin/admin/list')->with('success',"Admin Successfully created");
    }

public function edit($id)
    {
        $data['getRecord'] = User::getSingle($id);
        if (!empty($data['getRecord'])) {

            $data['header_title'] = "Edit Admin";
            return view('admin.admin.edit',$data);
        }
        else {
            abort(404);
        }
    }

public function update($id,Request $request){

        request()->validate([
            'email' => 'required|email|unique:users,email,'.$id
        ]);

        $user = user::getSingle($id);
        $user->name = trim($request->name);
        $user->email = trim($request->email);
        if (!empty($request->password)) {
            $user->password = Hash::make($request->password);
        }
        $user->save();

        return redirect('admin/admin/list')->with('success',"Admin Successfully updated!");
    }
    
public function delete($id){
        $user = User::getSingle($id);
        $user->is_delete = 1;
        $user->save();
        return redirect('admin/admin/list')->with('success',"Admin Successfully Deleted!");
    }
}