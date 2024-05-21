<?php
namespace App\Http\Controllers;
use App\Models\shippmodel;
use Illuminate\Http\Request;
use App\Exports\Trans_export;
use Carbon\Carbon;
use Hash;
use Excel;
class shipp extends Controller
{
    public function list(){

        $data['getRecord'] = shippmodel::getRecord(); 
        $data['header_title'] = "Shipment List";// Correct the model name
        return view('admin.shipp.list', $data);
        return view('export.shipp.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new Trans_export, 'ShipmentReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Shipment";
        return view('admin.shipp.add',$data);
        return view('export.shipp.list', $data);
    }
    public function insert(Request $request)
    {   
        $save = new shippmodel;
        $save->docs_received_date = trim($request->docs_received_date);
        $save->bill_no = trim($request->bill_no);
        $save->commodity = trim($request->commodity);
        $save->container_no = trim($request->container_no);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->Container_size = trim($request->Container_size);
        $save->stuffing = trim($request->stuffing);
        $save->shipping_line = trim($request->shipping_line);
        $save->gate_in_cfs = trim($request->gate_in_cfs);
        $save->assessment = trim($request->assessment);
        $save->deadline = trim($request->deadline);
        $save->docs_cutoff = trim($request->docs_cutoff);
        $save->pay_cutoff = trim($request->pay_cutoff);
        $save->vessel_name = trim($request->vessel_name);
        $save->eta = trim($request->eta);
        $save->etb = trim($request->etb);
        $save->etd = trim($request->etd);
        // Calculate spent_days
        $save->spent_days = $this->calculateSpentDays($request->cfs_gate_out, $request->gate_in_cfs);
        // Assuming free_days is already present in your form
        $save->free_days = trim($request->free_days);
        // Calculate remaining_days
        $save->remaining_days = $save->free_days - $save->spent_days;
        $save->cfs_gate_out = trim($request->cfs_gate_out);
        $save->container_to_port = trim($request->container_to_port);
        $save->scanner_report = trim($request->scanner_report);
        $save->loaded_on_board = trim($request->loaded_on_board);
        $save->current_status = trim($request->current_status);
        $save->save();

        return redirect('admin/shipp/list')->with('success',"Shipment Successfully Created");
        
       // return redirect('export/shipp/list')->with('success',"Shipment Successfully Created");

       }
       
    public function edit($id){
         $data['getRecord'] = shippmodel::getSingle($id);
         if (!empty($data['getRecord'])) {
            $data['header_title'] = "Edit shipment";
            return view('admin.shipp.edit',$data);
            return view('export.shipp.edit',$data);
         }
        else {
            abort(404);
        }
    }

    public function update($id, Request $request){
        $save = shippmodel::getSingle($id);
        $save->docs_received_date = trim($request->docs_received_date);
        $save->bill_no = trim($request->bill_no);
        $save->commodity = trim($request->commodity);
        $save->container_no = trim($request->container_no);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->Container_size = trim($request->Container_size);
        $save->stuffing = trim($request->stuffing);
        $save->shipping_line = trim($request->shipping_line);
        $save->gate_in_cfs = trim($request->gate_in_cfs);
        $save->assessment = trim($request->assessment);
        $save->deadline = trim($request->deadline);
        $save->docs_cutoff = trim($request->docs_cutoff);
        $save->pay_cutoff = trim($request->pay_cutoff);
        $save->vessel_name = trim($request->vessel_name);
        $save->eta = trim($request->eta);
        $save->etb = trim($request->etb);
        $save->etd = trim($request->etd);
         // Calculate spent_days
        $save->spent_days = $this->calculateSpentDays($request->cfs_gate_out, $request->gate_in_cfs);
         // Assuming free_days is already present in your form
        $save->free_days = trim($request->free_days);
         // Calculate remaining_days
        $save->remaining_days = $save->free_days - $save->spent_days;
        $save->cfs_gate_out = trim($request->cfs_gate_out);
        $save->container_to_port = trim($request->container_to_port);
        $save->scanner_report = trim($request->scanner_report);
        $save->loaded_on_board = trim($request->loaded_on_board);
        $save->current_status = trim($request->current_status);
        $save->save();
        return redirect('admin/shipp/list')->with('success', "Shipment Successfully Updated!");
        return redirect('export/shipp/list')->with('success', "Shipment Successfully Updated!");

    }
    private function calculateSpentDays($cfsGateOut, $gateInCfs)
    {
     $cfsGateOut = Carbon::parse($cfsGateOut);
     $gateInCfs = Carbon::parse($gateInCfs);

     return $cfsGateOut->diffInDays($gateInCfs);
    }
 
    public function delete($id){
        $save = shippmodel::getSingle($id);
        $save->is_delete = 1;
        $save->save();
        return redirect('admin/shipp/list')->with('success', "Shipment Successfully Deleted!");
        return redirect('export/shipp/list')->with('success', "Shipment Successfully Deleted!");
    }
}
