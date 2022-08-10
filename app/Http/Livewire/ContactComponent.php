<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Contact;


class ContactComponent extends Component
{
    public $name;
    public $email;
    public $phone;
    public $comment;


    public function updated($field){
        $this->validateOnly($field,[
            'name'=>'required',
            'email'=>'required|email',
            'phone' => 'required',
            'comment' => 'required'
        ]);
    }

    public function sendMessage(){
        $this->validate([
            'name'=>'required',
            'email'=>'required|email',
            'phone' => 'required',
            'comment' => 'required'
        ]);

        $contact=new Contact();
        $contact->name=$this->name;
        $contact->email=$this->email;
        $contact->phone=$this->phone;
        $contact->comment=$this->comment;
        $contact->save();
        session()->flash("contact_msg","Thanks, Your message has been sent Successfully!!");

    }

    public function render()
    {
        return view('livewire.contact-component')->layout('layouts.base');
    }
}