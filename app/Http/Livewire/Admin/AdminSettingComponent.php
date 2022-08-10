<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Settings;

class AdminSettingComponent extends Component
{
    public $email;
    public $phone;
    public $phone2;
    public $address;
    public $map;
    public $twiter;
    public $facebook;
    public $pinterest;
    public $instagram;
    public $youtube;

    public function mount()
    {
        $setting = Settings::find(1);
        if ($setting) {
            $this->email = $setting->email;
            $this->phone = $setting->phone;
            $this->phone2 = $setting->phone2;
            $this->address = $setting->address;
            $this->map = $setting->map;
            $this->twiter = $setting->twiter;
            $this->facebook = $setting->facebook;
            $this->pinterest = $setting->pinterest;
            $this->instagram = $setting->instagram;
            $this->youtube = $setting->youtube;
        }
    }

    public function updated($field)
    {
        $this->validateOnly($field, [
            'email' => 'required|email',
            'phone' => 'required',
            'phone2' => 'required',
            'address' => 'required',
            'map' => 'required',
            'twiter' => 'required',
            'facebook' => 'required',
            'pinterest' => 'required',
            'instagram' => 'required',
            'youtube' => 'required',
        ]);
    }

    public function saveSetting()
    {
        $this->validate([
            'email' => 'required|email',
            'phone' => 'required',
            'phone2' => 'required',
            'address' => 'required',
            'map' => 'required',
            'twiter' => 'required',
            'facebook' => 'required',
            'pinterest' => 'required',
            'instagram' => 'required',
            'youtube' => 'required',
        ]);

        $setting = Settings::find(1);
        if (!$setting) {
           $setting=new Settings();
        }
        $setting->email= $this->email;
        $setting->phone= $this->phone;
        $setting->phone2= $this->phone2;
        $setting->address= $this->address;
        $setting->map= $this->map;
        $setting->twiter= $this->twiter;
        $setting->facebook= $this->facebook;
        $setting->pinterest= $this->pinterest;
        $setting->instagram= $this->instagram;
        $setting->youtube= $this->youtube;
        $setting->save();
        session()->flash("msg","Setting has been saved Successfully!!");
    
    }
    public function render()
    {
        return view('livewire.admin.admin-setting-component')->layout(
            'layouts.base'
        );
    }
}
