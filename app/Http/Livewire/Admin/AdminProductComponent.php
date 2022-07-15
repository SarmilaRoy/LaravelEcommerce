<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Product;

class AdminProductComponent extends Component
{
    use WithPagination;

    public function deleteProduct($id){
        $category=Product::find($id);
        $category->delete();
        session()->flash("msg","Product has been deleted Successfully!!");

    }

    public function render()
    {
        $products=Product::paginate(5);
        return view('livewire.admin.admin-product-component',['products' => $products])->layout('layouts.base');
    }
}
