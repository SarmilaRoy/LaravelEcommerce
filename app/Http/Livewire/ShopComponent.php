<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Product;
use Cart;
use App\Models\Category;

class ShopComponent extends Component
{

    public $sorting;
    public $pagesize;

    public $min_price;
    public $max_price;

    public function mount(){
        $this->sorting= "default";
        $this->pagesize= 12;
        $this->min_price= 1;
        $this->max_price= 1000;
        //return redirect()->route('/shop');
    }

    public function store($product_id,$product_name,$product_price){
        Cart::instance('cart')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        session()->flash('cart-msg','Item Add in Cart');
        return redirect()->route('product.cart');
    }

    public function addToWishlist($product_id,$product_name,$product_price){
        Cart::instance('wishlist')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        $this->emitTo('wishlist-count-component','refreshComponent');
        return redirect()->route('product.shop');
    }

    public function romoveFormWishlist($product_id){
      foreach (Cart::instance('wishlist')->content() as $wishitemRemove) {
        if($wishitemRemove->id == $product_id){
            Cart::instance('wishlist')->remove($wishitemRemove->rowId);
            $this->emitTo('wishlist-count-component','refreshComponent');
            return redirect()->route('product.shop');
        }
      }
    }

    use WithPagination;
    public function render()
    {
        if($this->sorting=='date'){
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('created_at','DESC')->paginate($this->pagesize);  
        }
        else if($this->sorting=='price'){
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('regular_price','DESC')->paginate($this->pagesize);  
        }
        else if($this->sorting=='price-desc'){
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->orderBy('regular_price','DESC')->paginate($this->pagesize);  
        }
        else{
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->paginate($this->pagesize);  
        }

        $categories=Category::all();
        
       
        return view('livewire.shop-component',['products' => $products,'categories' => $categories])->layout('layouts.base');
    }
}
