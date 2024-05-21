<?php

namespace App\Http\Controllers;
use App\Models\reminder;
use Illuminate\Http\Request;

class ReminderController extends Controller
{
    
    public function list(){

        $data['getRecord'] = reminder::getRecord(); 
        $data['header_title'] = "Reminder Data";// Correct the model name
       // $data['unreadCount'] = Reminder::where('is_read', 0)->count();
        //$data['readCount'] = Reminder::where('is_read', 1)->count();
        return view('admin.reminder.list', $data);
    }
    public function add(){
        $data['header_title'] = "Add new Reminder";
        return view('admin.reminder.add',$data);
    }

    public function insert(Request $request)
    {
        $save = new Reminder;
        $save->alert = trim($request->alert);
        $save->date = trim($request->date);
        $save->is_read = 0; // Mark as unread by default
        $save->save();
    
        return redirect('admin/reminder/list')->with('success', "Reminder Successfully Created");
    }
    public function edit($id){
        $data['getRecord'] = reminder::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.reminder.edit',$data);
        }
       else {
           abort(404);
       }
     }
    public function update($id, Request $request){
        $save = reminder::getSingle($id);
        $save->alert = trim($request->alert);
        $save->date = trim($request->date);
        $save->save();
        
        return redirect('admin/reminder/list')->with('success', "Reminder Successfully Updated!");
    }
    public function delete($id){
        $save = reminder::getSingle($id);
        $save->is_delete = 1;
        $save->save();
        return redirect('admin/reminder/list')->with('success', "Reminder Successfully Deleted!");
     }
    
    public function checkReminders()
     {
         $reminders = Reminder::all(); 
     
         return response()->json($reminders);
     }

    public function markAsRead($id)
     {
         $reminder = Reminder::find($id);
     
         if ($reminder) {
             $reminder->update(['is_read' => 1]);
             return redirect('admin/dashboard')->with('success', 'Reminder marked as read.');
         } else {
             return redirect('admin/dashboard')->with('error', 'Reminder not found.');
         }
     }       
}
