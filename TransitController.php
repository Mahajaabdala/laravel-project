<?php

namespace App\Http\Controllers;
use App\Models\transit;
use Illuminate\Http\Request;
use App\Exports\exportlist;
//use Hash;
//use Auth;
use Excel;
class TransitController extends Controller
{
    public function list()
    {
        $data['getRecord'] = transit::getRecord();
        $data['header_title'] = "Transit List";
        return view('admin.transit.list',$data);
        //return view('transit.transit.list',$data);
    }

    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new exportlist, 'transitReport_'.date('d-m-Y').'.xls');
    }
 
    public function add(){
        $data['header_title'] = "Add New Data";
        return view('admin.transit.add',$data);
        
        
    }

    public function insert(Request $request){

        request()->validate([
            'docs_received' => 'required|date',
            'customer' => 'required|string|max:255',
            'consignee' => 'required|string|max:255',
            'bill_of_lading' => 'required|string|max:255',
            'commodity' => 'required|string|max:255',
            'container_size' => 'required|string|max:255',
            'container_no' => 'required|string|max:255',
            'final_pod' => 'required|string|max:255',
            'arrival' => 'required|date',
            'start_discharge' => 'required|date',
            'carry_in' => 'required|date',
            'truck_details' => 'required|string|max:255',
            'loading_date' => 'required|date',
            'departure' => 'required|date',
            'ata_border' => 'required|date',
            'atd_border' => 'required|date',
        
        ]);

        $transit = new transit;
        $transit->docs_received = trim($request->docs_received);
        $transit->customer = trim($request->customer);
        $transit->consignee = trim($request->consignee);
        $transit->bill_of_lading = trim($request->bill_of_lading);
        $transit->commodity = trim($request->commodity);
        $transit->container_size = trim($request->container_size);
        $transit->container_no = trim($request->container_no);
        $transit->final_pod = trim($request->final_pod);
        $transit->arrival = trim($request->arrival);
        $transit->start_discharge = trim($request->start_discharge);
        $transit->carry_in = trim($request->carry_in);
        $transit->truck_details = trim($request->truck_details);
        $transit->loading_date = trim($request->loading_date);
        $transit->departure = trim($request->departure);
        $transit->ata_border = trim($request->ata_border);
        $transit->atd_border = trim($request->atd_border);
        $transit->save();

        return redirect('admin/transit/list')->with('success',"New Data Sucessfully Created");
    }
    
public function edit($id)
{
    $data['getRecord'] = transit::getSingle($id);
    if (!empty($data['getRecord'])) {

        $data['header_title'] = "Edit Data";
        return view('admin.transit.edit',$data);
    }
    else {
        abort(404);
    }
}

public function update($id,Request $request){
   
    $transit = transit::getSingle($id);
    $transit->docs_received = trim($request->docs_received);
    $transit->customer = trim($request->customer);
    $transit->consignee = trim($request->consignee);
    $transit->bill_of_lading = trim($request->bill_of_lading);
    $transit->commodity = trim($request->commodity);
    $transit->container_size = trim($request->container_size);
    $transit->container_no = trim($request->container_no);
    $transit->final_pod = trim($request->final_pod);
    $transit->arrival = trim($request->arrival);
    $transit->start_discharge = trim($request->start_discharge);
    $transit->carry_in = trim($request->carry_in);
    $transit->truck_details = trim($request->truck_details);
    $transit->loading_date = trim($request->loading_date);
    $transit->departure = trim($request->departure);
    $transit->ata_border = trim($request->ata_border);
    $transit->atd_border = trim($request->atd_border);
    $transit->save();
    return redirect('admin/transit/list')->with('success',"Data Sucessfully Updated");
}
public function delete($id){
    $getRecord = transit::getSingle($id);
    if (!empty($getRecord)) {
        $getRecord->is_delete = 1;
        $getRecord->save();
    
    $user = transit::getSingle($id);
    $user->is_delete = 1;
    $user->save();

    return redirect()->back()->with('success',"Data Successfully Deleted!");
    }
    else {
        abort(404);
    }
   }
}
