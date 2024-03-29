<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Product;
//use Cart;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\Sale;
class ProductDetailsComponent extends Component
{
    public $slug;
    public $qty;


    public $selected_atrr=[];

    public function mount($slug){
        $this->slug=$slug;
        $this->qty=1;
    }

    public function store($product_id,$product_name,$product_price){
        Cart::instance('cart')->add($product_id,$product_name,$this->qty,$product_price,$this->selected_atrr)->associate('App\Models\Product');
        session()->flash('cart-msg','Item Add in Cart');
        return redirect()->route('product.cart');
        
    }
    

    public function increaseQuantity(){
       $this->qty++;
       
       
    }
    public function decreaseQuantity(){
        if($this->qty >1){
            $this->qty--;
            
           
        }
       
    
    }

 
    public function render()
    {
        $product=Product::where('slug',$this->slug)->first();
        $popular_product=Product::inRandomOrder()->limit(4)->get();
        $related_product=Product::where('category_id',$product->category_id)->inRandomOrder()->limit(5)->get();
        $sale=Sale::find(1);

        return view('livewire.product-details-component',['product'=>$product,'popular_product'=>$popular_product,'related_product'=>$related_product,'sale'=>$sale])->layout('layouts.base');
    }
}
