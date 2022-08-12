<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ProductAttribute;

class AdminAttributeComponent extends Component
{
    public function deleteAttribute($id){
        $pattribute=ProductAttribute::find($id);
        $pattribute->delete();
        session()->flash("msg","Category has been deleted Successfully!!");

    }
    public function render()
    {
        $pattributes=ProductAttribute::paginate(10);
        return view('livewire.admin.admin-attribute-component',['pattributes' => $pattributes])->layout('layouts.base');
    }
}
