<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Category;
use App\Models\Subcategory;

class AdminCategoryComponent extends Component
{
    use WithPagination;
    public function deleteCategory($id){
        $category=Category::find($id);
        $category->delete();
        session()->flash("msg","Category has been deleted Successfully!!");

    }

    public function deleteSubCategory($id){
        $scategory=Subcategory::find($id);
        $scategory->delete();
        session()->flash("msg","Subcategory has been deleted Successfully!!");

    }

    public function render()
    {
        $categories=Category::paginate(5);
        return view('livewire.admin.admin-category-component',['categories' => $categories])->layout('layouts.base');
    }
}
