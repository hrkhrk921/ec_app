Rails.application.routes.draw do
  root_to "home#top"
  get "/about" => "home#about"
  devise_for :customers
  devise_for :admins
#お客様
  resource :customer,only: [:show]
  resource :cart_item
  resource :delivery
  resources :item,only: [:show,:index]
  resources :orders,only: [:new,:create,:index,:show] do
    get "/order/finish" => "orders#finish"
    get "order/confirm" => "orders#confirm"
    post "/order/confirm" => "orders#confirm"
  end
    patch "/orders/:id" => "order_items#update"

#管理者
  namespace :admin do
    resources :orders
    resources :genres
    resources :items
    resources :customer
  end
end
