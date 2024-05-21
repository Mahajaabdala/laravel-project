<?php

namespace App\Http\Controllers;
use App\Models\shipping;
use Illuminate\Http\Request;
use App\Exports\ShippingLineReport;
use Excel;

class ShippingController extends Controller
{
    public function list(){

        $data['getRecord'] = shipping::getRecord(); 
        $data['header_title'] = "Shipping Data List";// Correct the model name
        return view('admin.shipping.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new ShippingLineReport, 'ShippingLineReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Data";
        return view('admin.shipping.add',$data);
    }
    public function insert(Request $request)
    {
        $save = new shipping;
        $save->docs_received_date = trim($request->docs_received_date);
        $save->file_no = trim($request->file_no);
        $save->consignee_name = trim($request->consignee_name);
        $save->bill_no = trim($request->bill_no);
        $save->no_of_unit = trim($request->no_of_unit);
        $save->shipping_line = trim($request->shipping_line);
        $save->do_status = trim($request->do_status);
        $save->date = trim($request->date);
        $save->save();

        return redirect('admin/shipping/list')->with('success',"New Data Successfully Created");
    }

    public function edit($id){
        $data['getRecord'] = shipping::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.shipping.edit',$data);
        }
       else {
           abort(404);
       }
   }

   public function update($id, Request $request){
       $save = shipping::getSingle($id);
       $save->docs_received_date = trim($request->docs_received_date);
        $save->file_no = trim($request->file_no);
        $save->consignee_name = trim($request->consignee_name);
        $save->bill_no = trim($request->bill_no);
        $save->no_of_unit = trim($request->no_of_unit);
        $save->shipping_line = trim($request->shipping_line);
        $save->do_status = trim($request->do_status);
        $save->date = trim($request->date);
        $save->save();
       
       return redirect('admin/shipping/list')->with('success', "Data Successfully Updated!");
   }
   public function delete($id){
    $save = shipping::getSingle($id);
    $save->is_delete = 1;
    $save->save();
    return redirect('admin/shipping/list')->with('success', "Data Successfully Deleted!");
 }
}
