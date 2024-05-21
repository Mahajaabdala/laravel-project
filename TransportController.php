<?php
namespace App\Http\Controllers;
use App\Models\transport;
use Illuminate\Http\Request;
use App\Exports\TransportReport;
use Excel;
class TransportController extends Controller
{
    public function list(){

        $data['getRecord'] = transport::getRecord(); 
        $data['header_title'] = "Transport Data List";// Correct the model name
        return view('admin.transport.list', $data);
    }
    public function export_list(Request $request){
        //dd($request->all());
        return Excel::download(new TransportReport, 'TransportReport_'.date('d-m-Y').'.xls');
    }
    public function add(){
        $data['header_title'] = "Add new Data";
        return view('admin.transport.add',$data);
    }
    public function insert(Request $request)
    {

        //dd($request->all());
        // Validate the incoming request data
        $validatedData = $request->validate([
            'bl' => 'required|string|max:255',
            'container_no' => 'required|string|max:255',
            'client' => 'required|string|max:255',
            'destination' => 'required|string|max:255',
            'gate_out' => 'required|string|max:255',
            'icd' => 'required|string|max:255',
            'agent_name' => 'required|string|max:255',
            'transporter' => 'required|string|max:255',
            'no_of_containers' => 'required|integer',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
        
        ]);

        $save = new transport;
        $save->bl= trim($request->bl);
        $save->container_no = trim($request->container_no);
        $save->client= trim($request->client);
        $save->destination = trim($request->destination);
        $save->gate_out = trim($request->gate_out);
        $save->icd = trim($request->icd);
        $save->agent_name = trim($request->agent_name);
        $save->transporter = trim($request->transporter);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->start_date = trim($request->start_date);
        $save->end_date = trim($request->end_date);
        $save->free_days = trim($request->free_days);
        $save->save();

        return redirect('admin/transport/list')->with('success',"New Data Successfully Created");
    }

    public function edit($id){
        $data['getRecord'] = transport::getSingle($id);
        if (!empty($data['getRecord'])) {
           $data['header_title'] = "Edit Data";
           return view('admin.transport.edit',$data);
        }
       else {
           abort(404);
       }
     }


     public function update($id, Request $request){

        $validatedData = $request->validate([
            'bl' => 'required|string|max:255',
            'container_no' => 'required|string|max:255',
            'client' => 'required|string|max:255',
            'destination' => 'required|string|max:255',
            'gate_out' => 'required|string|max:255',
            'icd' => 'required|string|max:255',
            'agent_name' => 'required|string|max:255',
            'transporter' => 'required|string|max:255',
            'no_of_containers' => 'required|integer',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
        

        ]);
        $save = transport::getSingle($id);
        $save->bl= trim($request->bl);
        $save->container_no = trim($request->container_no);
        $save->client= trim($request->client);
        $save->destination = trim($request->destination);
        $save->gate_out = trim($request->gate_out);
        $save->icd = trim($request->icd);
        $save->agent_name = trim($request->agent_name);
        $save->transporter = trim($request->transporter);
        $save->no_of_containers = trim($request->no_of_containers);
        $save->start_date = trim($request->start_date);
        $save->end_date = trim($request->end_date);
        $save->free_days = trim($request->free_days);
        $save->save();
        
        return redirect('admin/transport/list')->with('success', "Data Successfully Updated!");
    }
    public function delete($id){
     $save = transport::getSingle($id);
     $save->is_delete = 1;
     $save->save();
     return redirect('admin/shipping/list')->with('success', "Data Successfully Deleted!");
  }
}