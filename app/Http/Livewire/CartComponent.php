<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;
//use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\Coupon;

class CartComponent extends Component
{

    public $haveCouponCode;
    public $couponCode;
    public $discount;
    public $subTotalAfterDiscount;
    public $texAfterDiscount;
    public $totalAfterDiscount;
    
    public function increaseQuantity($rowId){
        $product=Cart::instance('cart')->get($rowId);
        $qty=$product->qty +1;
        //dd($qty);
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
        
    }
    public function decreaseQuantity($rowId){
        $product=Cart::instance('cart')->get($rowId);
        $qty=$product->qty -1;
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
        
    }
    public function destroy($rowId){
        Cart::instance('cart')->remove($rowId);
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('cart-msg','Item has been remove');  

    }
    public function destroyAll(){
        Cart::instance('cart')->destroy();
        $this->emitTo('cart-count-component','refreshComponent');
      
    }

    public function switchToSaveForLater($rowId){
    
        $item=Cart::instance('cart')->get($rowId);
        Cart::instance('cart')->remove($rowId);
        Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('cart-msg','Item has been saved for later');
      
    }
    public function moveToCart($rowId){
    
        $item=Cart::instance('saveForLater')->get($rowId);
        Cart::instance('saveForLater')->remove($rowId);
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('moveTocart-msg','Item has been moved to cart');

    }

    public function deleteFromSaveForLater($rowId){
    
        Cart::instance('saveForLater')->remove($rowId);
        session()->flash('moveTocart-msg','Item has been removed from saved for later');

    }
    public function applyCouponCode(){
        $coupon= Coupon::where('code',$this->couponCode)->where('cart_value','<=',Cart::instance('cart')->subtotal())->first();
        //dd($coupon);
        if(!$coupon){
            session()->flash('msg_coupon','Coupon code is Invalid');
            return;
        }
        session()->put('coupon',[
            'code'=> $coupon->code,
            'type'=> $coupon->type,
            'value'=> $coupon->value,
            'cart_value'=> $coupon->cart_value
        ]);
    }

    public function calculateDiscounts(){
        if(session()->has('coupon')){
            if(session()->get('coupon')['type'] == 'fixed'){
                $this->discount = session()->get('coupon')['value'];
            }
            else{
                $this->discount = (Cart::instance('cart')->subtotal() * session()->get('coupon')['value'])/100;
            }
            $this->subTotalAfterDiscount =Cart::instance('cart')->subtotal() - $this->discount;
            $this->texAfterDiscount = ($this->subTotalAfterDiscount * config('cart.tax'))/100;
            $this->totalAfterDiscount = $this->subTotalAfterDiscount +$this->texAfterDiscount;
            

        }
    }
    public function removeCoupon(){
        session()->forget('coupon');
    }

    public function render()
    {
        if(session()->has('coupon')){
            if(Cart::instance('cart')->subtotal() < session()->get('coupon')['cart_value']){
                session()->forget('coupon');
            }
            else{
                $this->calculateDiscounts();
            }
        }
        return view('livewire.cart-component')->layout('layouts.base');
    }
}
