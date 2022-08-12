<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ProductAttribute;


class AdminEditAttributeComponent extends Component
{
    public $name;
    public $attribute_id;

    public function mount($attribute_id)
    {
            $pattributes = ProductAttribute::find($attribute_id);
            $this->attribute_id = $pattributes->id;
            $this->name = $pattributes->name;
           
    }

    
    public function updated($field){
        $this->validateOnly($field,[
            'name'=>'required',
        ]);
    }


    public function updateAttribute(){
        $this->validate([
            'name' => 'required',
        ]);
        $pattributes = ProductAttribute::find($this->attribute_id);
        $pattributes->name = $this->name;
        $pattributes->save();
        session()->flash('msg', 'Category has been created Successfully!!');
    }
    public function render()
    {
        return view('livewire.admin.admin-edit-attribute-component')->layout('layouts.base');
    }
}
