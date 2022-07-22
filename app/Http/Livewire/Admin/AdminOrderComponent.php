<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Order;

class AdminOrderComponent extends Component
{
    public function render()
    {
        $orders=Order::orderBy('created_at','DESC')->paginate(10);
        return view('livewire.admin.admin-order-component')->layout('layouts.base');
    }
}
