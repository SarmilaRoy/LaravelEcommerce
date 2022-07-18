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

    public function render()
    {
        return view('livewire.cart-component')->layout('layouts.base');
    }
}
