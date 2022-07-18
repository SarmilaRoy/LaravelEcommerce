<?php

namespace App\Http\Livewire;

use Livewire\Component;
//use Cart;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartComponent extends Component
{
    
    public function increaseQuantity($rowId){
        $product=Cart::instance('cart')->get($rowId);
        $qty=$product->qty +1;
        //dd($qty);
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
        return redirect()->route('product.cart');
    }
    public function decreaseQuantity($rowId){
        $product=Cart::instance('cart')->get($rowId);
        $qty=$product->qty -1;
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
        return redirect()->route('product.cart');
    }
    public function destroy($rowId){
        Cart::instance('cart')->remove($rowId);
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('cart-msg','Item has been remove');
        return redirect()->route('product.cart');

    }
    public function destroyAll(){
        Cart::instance('cart')->destroy();
        $this->emitTo('cart-count-component','refreshComponent');
        return redirect()->route('product.cart');
       

    }

    public function switchToSaveForLater($rowId){
    
        $item=Cart::instance('cart')->get($rowId);
        Cart::instance('cart')->remove($rowId);
        Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('cart-msg','Item has been saved for later');
        return redirect()->route('product.cart');

    }
    public function moveToCart($rowId){
    
        $item=Cart::instance('saveForLater')->get($rowId);
        Cart::instance('saveForLater')->remove($rowId);
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('moveTocart-msg','Item has been moved to cart');
        return redirect()->route('product.cart');

    }

    public function deleteFromSaveForLater($rowId){
    
        Cart::instance('saveForLater')->remove($rowId);
        session()->flash('moveTocart-msg','Item has been removed from saved for later');
        return redirect()->route('product.cart');
      

    }

    public function render()
    {
        return view('livewire.cart-component')->layout('layouts.base');
    }
}
