<?php

// app/Http/Controllers/CountdownController.php

namespace App\Http\Controllers;

use App\Models\Countdown;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CountdownController extends Controller
{
    public function showCountdown()
    {
        $countdown = Countdown::first(); // Assuming you have one record

    if ($countdown) {
        return view('admin/count/list', compact('countdown'));
     } else {
        // Handle the case where there is no record in the countdowns table
        return view('admin/count/list')->with('countdown', null);
      }
    } 
    public function updateDates(Request $request)
    {
        $request->validate([
            'arrival_date' => 'required|date',
            'end_date' => 'required|date|after:arrival_date',
        ]);

        Countdown::updateOrCreate([], [
            'arrival_date' => $request->input('arrival_date'),
            'end_date' => $request->input('end_date'),
            'current_date' => $request->input('arrival_date'), // Initialize current_date with arrival_date
        ]);

        return redirect()->route('countdown.show')->with('success', 'Dates updated successfully.');
    }

    public function updateCurrentDate()
    {
        $countdown = Countdown::first(); // Assuming you have one record

        if ($countdown && $countdown->current_date && $countdown->end_date) {
            $currentDate = Carbon::parse($countdown->current_date);
            $endDate = Carbon::parse($countdown->end_date);

            if ($currentDate->lessThan($endDate)) {
                $countdown->update(['current_date' => $currentDate->addDay()]);
            } else {
                return response()->json(['status' => 'completed']);
            }

            return response()->json(['status' => 'success']);
        } else {
            return response()->json(['error' => 'No valid record found.']);
        }
    }
    
    public function getRemainingDays()
    {
        $countdown = Countdown::first(); // Assuming you have one record

        if ($countdown && $countdown->current_date && $countdown->end_date) {
            $currentDate = Carbon::parse($countdown->current_date);
            $endDate = Carbon::parse($countdown->end_date);
            $remainingDays = max(0, $endDate->diffInDays($currentDate));

            return response()->json(['remainingDays' => $remainingDays]);
        } else {
            return response()->json(['error' => 'No valid record found.']);
        }
    }
}
