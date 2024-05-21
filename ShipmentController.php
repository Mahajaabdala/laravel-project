<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\shipment;
use App\Exports\exportShipments;
use Hash;
//use Auth;
use Excel;

class ShipmentController extends Controller
{    
    public function list(){

        $data['getRecord'] = shipment::getRecord(); 
        $data['header_title'] = "Shipment List";// Correct the model name
        return view('admin.shipments.list', $data);
        return view('export.shipments.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new exportShipments, 'ShipmentReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Shipment";
        return view('admin.shipments.add',$data);
        return view('export.shipments.list', $data);
    }
    public function insert(Request $request)
    {
        $save = new shipment;
        $save->docs_received_date = trim($request->docs_received_date);
        $save->bill_no = trim($request->bill_no);
        $save->commodity = trim($request->commodity);
        $save->container_no = trim($request->container_no);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->Container_size = trim($request->Container_size);
        $save->stuffing = trim($request->stuffing);
        $save->shipping_line = trim($request->shipping_line);
        $save->empty_gate_out = trim($request->empty_gate_out);
        $save->empty_gate_in = trim($request->empty_gate_in);
        $save->assessment = trim($request->assessment);
        $save->deadline = trim($request->deadline);
        $save->pay_cutoff = trim($request->pay_cutoff);
        $save->vessel_name = trim($request->vessel_name);
        $save->container_to_port = trim($request->container_to_port);
        $save->scanner_report = trim($request->scanner_report);
        $save->loaded_on_board = trim($request->loaded_on_board);
        $save->current_status = trim($request->current_status);
        $save->save();

        return redirect('admin/shipments/list')->with('success',"Shipment Successfully Created");
        
        return redirect('export/shipments/list')->with('success',"Shipment Successfully Created");

    }
    public function edit($id){
         $data['getRecord'] = shipment::getSingle($id);
         if (!empty($data['getRecord'])) {
            $data['header_title'] = "Edit shipment";
            return view('admin.shipments.edit',$data);
            return view('export.shipments.edit',$data);
         }
        else {
            abort(404);
        }
    }

    public function update($id, Request $request){
        $save = shipment::getSingle($id);
        $save->docs_received_date = trim($request->docs_received_date);
        $save->bill_no = trim($request->bill_no);
        $save->commodity = trim($request->commodity);
        $save->container_no = trim($request->container_no);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->Container_size = trim($request->Container_size);
        $save->stuffing = trim($request->stuffing);
        $save->shipping_line = trim($request->shipping_line);
        $save->empty_gate_out = trim($request->empty_gate_out);
        $save->empty_gate_in = trim($request->empty_gate_in);
        $save->assessment = trim($request->assessment);
        $save->deadline = trim($request->deadline);
        $save->pay_cutoff = trim($request->pay_cutoff);
        $save->vessel_name = trim($request->vessel_name);
        $save->container_to_port = trim($request->container_to_port);
        $save->scanner_report = trim($request->scanner_report);
        $save->loaded_on_board = trim($request->loaded_on_board);
        $save->current_status = trim($request->current_status);
        $save->save();
        return redirect('admin/shipments/list')->with('success', "Shipment Successfully Updated!");
        return redirect('export/shipments/list')->with('success', "Shipment Successfully Updated!");

    }
    public function delete($id){
        $save = shipment::getSingle($id);
        $save->is_delete = 1;
        $save->save();
        return redirect('admin/shipments/list')->with('success', "Shipment Successfully Deleted!");
        return redirect('export/shipments/list')->with('success', "Shipment Successfully Deleted!");
    }
}