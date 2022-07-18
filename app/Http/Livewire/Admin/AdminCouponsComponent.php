<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Coupon;

class AdminCouponsComponent extends Component
{
    public function deleteCoupon($id){
        $coupon=Coupon::find($id);
        $coupon->delete();
        session()->flash("msg","Coupon has been deleted Successfully!!");

    }
    public function render()
    {
        $coupons=Coupon::all();
        return view('livewire.admin.admin-coupons-component',['coupons'=>$coupons])->layout('layouts.base');
    }
}
