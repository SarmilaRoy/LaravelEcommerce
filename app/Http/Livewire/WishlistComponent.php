<?php

namespace App\Http\Livewire;

use Livewire\Component;
//use Cart;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\Product;
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

    //   public function store($product_id,$product_name,$product_price){
    //     Cart::instance('cart')->add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
    //     session()->flash('cart-msg','Item Add in Cart');
    //     return redirect()->route('product.cart');
    // }

    public function moveProductFromWishlistToCart($rowId){
      $item=Cart::instance('wishlist')->get($rowId);
      Cart::instance('wishlist')->remove($rowId);
      Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
      $this->emitTo('wishlist-count-component','refreshComponent');
      $this->emitTo('cart-count-component','refreshComponent');
      return redirect()->route('product.wishlist');
    }
  
    public function render()
    {
        return view('livewire.wishlist-component')->layout('layouts.base');
    }
}
