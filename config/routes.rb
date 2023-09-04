Rails.application.routes.draw do
  root 'products#index'

  get 'vendors/:id/products', to: 'products#view_vendor_product'
  get '/products/:id/product_variants', to: 'product_variants#view_product_variants'
  get 'vendors/:vendor_id/products/:product_id/product_variants', to: 'product_variants#view_vendor_product_variants'

  delete '/customers/:id/carts', to: 'carts#destroy_all'
  delete '/customers/:id/orders', to: 'orders#destroy_all'

  get '/search_by', to: 'products#search'
  delete '/delete_by_name', to: 'products#delete_by_name'

  resources :vendors, only: [:index, :create, :show, :update, :destroy]

  resources :products, only: [:index, :create, :show, :update, :destroy] do
    member do
      patch "images", action: "images"
    end
  end

  resources :product_variants, only: [:index, :create, :show, :update, :destroy]

  resources :customers, only: [:index, :create, :show, :update, :destroy] do

    resources :carts, only: [:index]

    resources :orders, only: [:index]
  end

  resources :carts, only: [:create, :show, :update, :destroy]

  resources :orders, only: [:create, :show, :update, :destroy]
end
