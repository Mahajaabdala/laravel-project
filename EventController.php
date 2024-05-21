<?php
// app/Http/Controllers/TaskController.php

namespace App\Http\Controllers;
use App\Models\Event;
use Carbon\Carbon;

class EventController extends Controller
{
    public function checkeventStatus()
    {
        $events = Event::all();

        foreach ($event as $event) {
            $endDate = Carbon::parse($event->end_date);
            $difference = now()->diffInDays($endDate, false);

            if ($difference === 0) {
                // Send notifications or perform other actions
                // For simplicity, let's just update a field in the database
                $event->update(['status' => 'completed']);
            }
        }

        return 'Event status checked!';
    }
}
