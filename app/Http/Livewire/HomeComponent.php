<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\HomeSlider;
use App\Models\Product;
use App\Models\HomeCategory;
use App\Models\Category;
use App\Models\Sale;
use Cart;
use Illuminate\Support\Facades\Auth;
class HomeComponent extends Component
{
    public function render()
    {
        $sliders = HomeSlider::where('status', 1)->get();
        $products = Product::orderBy('created_at', 'DESC')
            ->get()
            ->take(8);
        $category = HomeCategory::find(1);
        $cat = explode(',', $category->sel_categories);
        $categories = Category::whereIn('id', $cat)->get();
        $no_of_products = $category->no_of_products;
        $sale_products = Product::where('sale_price', '>', 0)
            ->inRandomOrder()
            ->get()
            ->take(8);
        $sale = Sale::find(1);

        if (Auth::check()) {
            Cart::instance('cart')->restore(Auth::user()->email);
            Cart::instance('wishlist')->restore(Auth::user()->email);
        }

        return view('livewire.home-component', [
            'sliders' => $sliders,
            'products' => $products,
            'categories' => $categories,
            'no_of_products' => $no_of_products,
            'sale_products' => $sale_products,
            'sale' => $sale,
        ])->layout('layouts.base');
    }
}
