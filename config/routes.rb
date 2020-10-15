Rails.application.routes.draw do
  root_to "home#top"
  get "/about" => "home#about"
  devise_for :customers
  devise_for :admins
#お客様
  resource :customer,only: [:show,:update] do
    get "customer/emend" => "customers#emend"
    get "customer/confirm" => "customers#confirm"
    put "customer/hide" => "customers#hide"
  end
  resource :cart_item
  resource :delivery
  resources :item,only: [:show,:index]
  resources :orders,only: [:new,:create,:index,:show] do
    get :finish, on: :collection
    get :confirm, on: :collection
    post :confirm, on: :collection
  end
  patch "/order_items/:id" => "order_items#update"

#管理者
  namespace :admin do
    resources :orders
    resources :genres
    resources :items
    resources :customer
  end
end
