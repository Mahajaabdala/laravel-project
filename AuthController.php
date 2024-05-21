<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use Auth;
use App\Models\user;
use App\Mail\ForgotPasswordMail;
use Mail;

class AuthController extends Controller
{
    public function login(){
       // dd(Hash::make(123456));
       if (!empty(Auth::check())) {
        if (Auth::user()->user_type == 1) {
          return redirect('admin/dashboard');
       }
       else if(Auth::user()->user_type == 2){
          return redirect('export/dashboard');
       }

       else if(Auth::user()->user_type == 3){
          return redirect('imports/dashboard');
      }

       else if(Auth::user()->user_type == 4){
           return redirect('transit/dashboard');
    }
    
       }
        return view('auth.login');
    }

    public function AuthLogin(Request $request)
    {
      $remember = !empty($request->remember) ? true : false;
      if (Auth::attempt(['email' => $request->email, 'password' => $request->password], true)) {
        # code...
        if (Auth::user()->user_type == 1) {
           return redirect('admin/dashboard');
        }
        else if(Auth::user()->user_type == 2){
           return redirect('export/dashboard');
        }

        else if(Auth::user()->user_type == 3){
           return redirect('imports/dashboard');
       }

        else if(Auth::user()->user_type == 4){
            return redirect('transit/dashboard');
     }

      }else 
      {
        return redirect()->back()->with('error','Please enter the correct email and password');
      }
    }

    public function forgotpassword(){
      return view('auth.forgot');                           
    }
    
    public function PostForgotPassword(Request $request){
      $checkEmail = User::getEmailCheck($request->email);
      $user = User::getEmailSingle($request->email);
      if (!empty($user)) {
              
                 Mail::to($user->email)->send(new PostForgotPasswordMail($user));
      }else {
         return redirect()->back()->with('error', "Email not found in the system.");
      }
    }
    public function logout()
    {
        Auth::logout();
        return redirect(url(''));
    }
}
