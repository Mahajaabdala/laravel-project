<?php

namespace App\Http\Controllers;
use App\Models\FreeDay;
use Illuminate\Http\Request;

class FreedayController extends Controller
{
    
}

// In your controller where you create/update tasks



// ...

$startDate = $request->input('start_date');
$endDate = $request->input('end_date');

// Calculate free days
$freeDays = calculateFreeDays($startDate, $endDate);

// Save/update task
$task = Task::create($request->all());

// Save/update free days
FreeDay::updateOrCreate(
    ['start_date' => $startDate, 'end_date' => $endDate],
    ['free_days' => $freeDays]
);

// ...

function calculateFreeDays($startDate, $endDate)
{
    // Your logic to calculate free days goes here
    // Subtract $endDate - $startDate and calculate the difference

    return $difference;
}
