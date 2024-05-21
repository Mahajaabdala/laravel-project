<?php
// app/Http/Controllers/TaskController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    public function index()
    {
        $task = Task::all();
        $totalRemainingDays = Task::calculateTotalRemainingDays();
        return view('admin.task.index', compact('task', 'totalRemainingDays'));
    }

    // ... other methods remain unchanged
}
