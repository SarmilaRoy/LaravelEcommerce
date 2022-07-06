<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;

class AdminDeshboardComponent extends Component
{
    public function render()
    {
        return view('livewire.admin.admin-deshboard-component')->layout('layouts.base');
    }
}
