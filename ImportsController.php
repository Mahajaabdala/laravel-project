<?php

namespace App\Http\Controllers;
use App\Models\imports;
use Illuminate\Http\Request;
use App\Exports\importReport;
use Excel;
class ImportsController extends Controller
{   
   public function dashboard(){
    $Imports = imports::all();
    return view('admin.dashboard', compact('Imports'));
   }

    public function list(){


        $data['getRecord'] = imports::getRecord(); 
        $data['header_title'] = "Imports Data List";// Correct the model name
        return view('admin.imports.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new importReport, 'ImportsReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Data";
        return view('admin.imports.add',$data);
    }
    public function insert(Request $request)
    {

        //dd($request->all());
        // Validate the incoming request data
        $save = new imports;
        $save->received_date = trim($request->received_date);
        $save->file_no = trim($request->file_no);
        $save->supplier = trim($request->supplier);
        $save->importer = trim($request->importer);
        $save->invoice = trim($request->invoice);
        $save->item_description = trim($request->item_description);
        $save->mode_of_transport = trim($request->mode_of_transport);
        $save->bill_of_lading = trim($request->bill_of_lading);
        $save->container_number = trim($request->container_number);
        $save->container_size = trim($request->container_size);
        $save->place_of_delivery = trim($request->place_of_delivery);
        $save->eta = trim($request->eta);
        $save->etb = trim($request->etb);
        $save->discharge_date = trim($request->discharge_date);
        $save->arrived_icd = trim($request->arrived_icd);
        $save->remarks = trim($request->remarks);
        $save->save();

        return redirect('admin/imports/list')->with('success',"New Data Successfully Created");
    }

    public function edit($id){
        $data['getRecord'] = imports::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.imports.edit',$data);
        }
       else {
           abort(404);
       }
     }

     public function update($id, Request $request){
        $save = imports::getSingle($id);
        $save->received_date = trim($request->received_date);
        $save->file_no = trim($request->file_no);
        $save->supplier = trim($request->supplier);
        $save->importer = trim($request->importer);
        $save->invoice = trim($request->invoice);
        $save->item_description = trim($request->item_description);
        $save->mode_of_transport = trim($request->mode_of_transport);
        $save->bill_of_lading = trim($request->bill_of_lading);
        $save->container_number = trim($request->container_number);
        $save->container_size = trim($request->container_size);
        $save->place_of_delivery = trim($request->place_of_delivery);
        $save->eta = trim($request->eta);
        $save->etb = trim($request->etb);
        $save->discharge_date = trim($request->discharge_date);
        $save->arrived_icd = trim($request->arrived_icd);
        $save->remarks = trim($request->remarks);

        $save->save();
        
        return redirect('admin/imports/list')->with('success', "Data Successfully Updated!");

    }
    public function delete($id){
        $save = imports::getSingle($id);
        $save->is_delete = 1;
        $save->save();
        return redirect('admin/imports/list')->with('success', "Data Successfully Deleted!");
    }
}