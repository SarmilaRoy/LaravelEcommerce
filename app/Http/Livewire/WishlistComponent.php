<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;

class WishlistComponent extends Component
{
    public function romoveFormWishlist($product_id){
        foreach (Cart::instance('wishlist')->content() as $wishitemRemove) {
          if($wishitemRemove->id == $product_id){
              Cart::instance('wishlist')->remove($wishitemRemove->rowId);
              $this->emitTo('wishlist-count-component','refreshComponent');
              return redirect()->route('product.wishlist');
          }
        }
      }

      public function store($product_id,$product_name,$product_price){
        Cart::instance('cart')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        session()->flash('cart-msg','Item Add in Cart');
        return redirect()->route('product.cart');
    }
  
    public function render()
    {
        return view('livewire.wishlist-component')->layout('layouts.base');
    }
}
