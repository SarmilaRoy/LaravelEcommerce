<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\Subcategory;
class AdminAddCategoryComponent extends Component
{
    public $name;
    public $slug;
    public $category_id;

    public function generateSlug(){
        $this->slug=Str::slug($this->name);
    }
    public function validateUpdate($field){
        $this->validateOnly($field,[
            'name'=>'required',
            'slug'=>'required|unique:categories'
        ]);
    }
    public function storeCategory(){
        $this->validate([
            'name'=>'required',
            'slug'=>'required|unique:categories'
        ]);

        if($this->category_id){
            $scategory=new Subcategory();
            $scategory->name=$this->name;
            $scategory->slug=$this->slug;
            $scategory->category_id=$this->category_id;
            $scategory->save();
        }

        else{
            $category=new Category();
            $category->name=$this->name;
            $category->slug=$this->slug;
            $category->save();
        }
       
        session()->flash("msg","Category has been created Successfully!!");
    }
    public function render()
    {
        $categories=Category::all();
        return view('livewire.admin.admin-add-category-component',['categories' => $categories])->layout('layouts.base');
    }
}
