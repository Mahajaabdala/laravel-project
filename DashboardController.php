<?php
namespace App\Http\Controllers;
use App\Models\imports;
use App\Models\reminder;
use App\Models\shipment;
use App\Models\shipping;
use App\Models\transit;
use App\Models\transport;
use App\Models\booking;
use Illuminate\Http\Request;
use Auth;
class DashboardController extends Controller
{

    public function dashboard(){
      //$data['header_title'] = 'Dashboard';
      $imports = imports::count();

           if (Auth::user()->user_type == 1) {
           return view('admin.dashboard', compact('imports'));
          //$reminders = Reminder::where('is_read', 0)->get();
            // Pass the reminders to the view
          //$data['reminders'] = Reminder::all(); 
          //$data['reminders'] = $reminders;
         return view('admin.dashboard');
   
         }
         else if(Auth::user()->user_type == 2){
          
            return view('export.dashboard');
         }

         else if(Auth::user()->user_type == 3){

            return view('imports.dashboard');
        }
  
         else if(Auth::user()->user_type == 4){

             return view('transit.dashboard');
      }
    }
}
