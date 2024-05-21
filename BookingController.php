<?php

namespace App\Http\Controllers;
use App\Models\booking;
use Illuminate\Http\Request;

class BookingController extends Controller
{   

    public function list(){

        $data['getRecord'] = booking::getRecord(); 
        $data['header_title'] = "Transport Data List";// Correct the model name
        return view('admin.booking.list', $data);
    }
    public function add(){
        $data['header_title'] = "Add new Data";
        return view('admin.booking.add',$data);
    }
    public function insert(Request $request)
    {

        //dd($request->all());
        // Validate the incoming request data
        
        $save = new booking;
        $save->shipper = trim($request->shipper);
        $save->consignee = trim($request->consignee);
        $save->container_size = trim($request->container_size);
        $save->destination = trim($request->destination);
        $save->vessel = trim($request->vessel);
        $save->deadline_date = trim($request->deadline_date);
        $save->payment_cutoff_date = trim($request->payment_cutoff_date);
        $save->empty_gate_out_date = trim($request->empty_gate_out_date);
        $save->empty_gate_in_date = trim($request->empty_gate_in_date);
        $save->stuffing_date = trim($request->stuffing_date);
        $save->loading_date = trim($request->loading_date);
        $save->save();

        return redirect('admin/transport/list')->with('success',"New Data Successfully Created");
    }

    public function edit($id){
        $data['getRecord'] = booking::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.booking.edit',$data);
        }
       else {
           abort(404);
       }
     }

     public function update($id, Request $request){
        $save = booking::getSingle($id);
        $save->shipper = trim($request->shipper);
        $save->consignee = trim($request->consignee);
        $save->container_size = trim($request->container_size);
        $save->destination = trim($request->destination);
        $save->vessel = trim($request->vessel);
        $save->deadline_date = trim($request->deadline_date);
        $save->payment_cutoff_date = trim($request->payment_cutoff_date);
        $save->empty_gate_out_date = trim($request->empty_gate_out_date);
        $save->empty_gate_in_date = trim($request->empty_gate_in_date);
        $save->stuffing_date = trim($request->stuffing_date);
        $save->loading_date = trim($request->loading_date);       
        $save->save();
        
        return redirect('admin/booking/list')->with('success', "Data Successfully Updated!");
    }
    public function delete($id){
     $save = booking::getSingle($id);
     $save->is_delete = 1;
     $save->save();
     return redirect('admin/booking/list')->with('success', "Data Successfully Deleted!");
  }
}
