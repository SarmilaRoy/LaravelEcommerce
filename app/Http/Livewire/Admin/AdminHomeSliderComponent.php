<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\HomeSlider;
class AdminHomeSliderComponent extends Component
{
    public function deleteSlider($slide_id){
        $sliders=HomeSlider::find($slide_id);
        $sliders->delete();
        session()->flash("msg","Product has been deleted Successfully!!");

    }
    public function render()
    {
        $sliders=HomeSlider::all();
        return view('livewire.admin.admin-home-slider-component',['sliders' => $sliders])->layout('layouts.base');
    }
}
