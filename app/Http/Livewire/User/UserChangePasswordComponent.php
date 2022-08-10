<?php

namespace App\Http\Livewire\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

use Livewire\Component;

class UserChangePasswordComponent extends Component
{
    public $current_password;
    public $password;
    public $password_confirmation;


    public function updated($field){
        $this->validateOnly($field,[
            'current_password'=>'required',
            'password'=>'required|min:8|confirmed|different:current_password',
            'password_confirmation' => 'required|same:password'
        ]);
    }

    public function chagePassword(){
        $this->validate([
            'current_password'=>'required',
            'password'=>'required|min:8|confirmed|different:current_password',
            'password_confirmation' => 'required|same:password'
        ]);

        if(Hash::check($this->current_password,Auth::user()->password)){
            $user =User::findOrFail(Auth::user()->id);
            $user->password=Hash::make($this->password);
            $user->save();
            session()->flash("pass_change_msg","Password has been change Successfully!!");

        }
        else{
            session()->flash("pass_error","Password does not ,match!!");

        }

    }

    public function render()
    {
        return view('livewire.user.user-change-password-component')->layout('layouts.base');
    }
}
