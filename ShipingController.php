<?php

namespace App\Http\Controllers;
use App\Models\shiping;
use App\Exports\ShipingReport;
use Illuminate\Http\Request;
use Auth;
use Excel;
class ShipingController extends Controller
{
    public function list(){

        $data['getRecord'] = shiping::getRecord(); 
        $data['header_title'] = "Data List";// Correct the model name
        return view('admin.shiping.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new ShipingReport, 'ShipingLineReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Data";
        return view('admin.shiping.add',$data);
    }
    public function insert(Request $request)
    {

        //dd($request->all());
        // Validate the incoming request data
        
        $save = new shiping;
        $save->bl = trim($request->bl);
        $save->container_no = trim($request->container_no);
        $save->client = trim($request->client);
        $save->destination = trim($request->destination);
        $save->gate_out_date = trim($request->gate_out_date);
        $save->icd = trim($request->icd);
        $save->day_of_week = trim($request->day_of_week);
        $save->transporter = trim($request->transporter);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->save();
        
        return redirect('admin/shiping/list')->with('success',"New Data Successfully Created");
    }

    public function edit($id){
        $data['getRecord'] = shiping::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.shiping.edit',$data);
        }
       else {
           abort(404);
       }
   }

   public function update($id, Request $request){
       $save = shiping::getSingle($id);
       $save->bl = trim($request->bl);
       $save->container_no = trim($request->container_no);
       $save->client = trim($request->client);
       $save->destination = trim($request->destination);
       $save->gate_out_date = trim($request->gate_out_date);
       $save->icd = trim($request->icd);
       $save->day_of_week = trim($request->day_of_week);
       $save->transporter = trim($request->transporter);
       $save->no_of_containers = trim($request->no_of_containers);
       $save->save();       
       return redirect('admin/shiping/list')->with('success', "Data Successfully Updated!");
   }
   public function delete($id){
    $save = shiping::getSingle($id);
    $save->is_delete = 1;
    $save->save();
    return redirect('admin/shiping/list')->with('success', "Data Successfully Deleted!");
 }
}
