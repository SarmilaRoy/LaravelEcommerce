<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Contact;

class AdmincontactComponent extends Component
{
    public function render()
    {
        $contacts=Contact::paginate(12);
        return view('livewire.admin.admincontact-component',['contacts'=>$contacts])->layout('layouts.base');
    }
}
