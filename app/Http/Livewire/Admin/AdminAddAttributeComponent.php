<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;

use App\Models\ProductAttribute;

class AdminAddAttributeComponent extends Component
{
    public $name;

    public function updated($field){
        $this->validateOnly($field,[
            'name'=>'required',
        ]);
    }

    public function storeAttribute()
    {
        $this->validate([
            'name' => 'required',
        ]);
        $pattributes = new ProductAttribute();
        $pattributes->name = $this->name;
        $pattributes->save();
        session()->flash('msg', 'Category has been created Successfully!!');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-attribute-component')->layout(
            'layouts.base'
        );
    }
}
