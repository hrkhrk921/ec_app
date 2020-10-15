Rails.application.routes.draw do
  root_to "home#top"
  get "/about" => "home#about"
  devise_for :customers
  devise_for :admins
#お客様
  resource :customer,only: [:show]
  resource :cart_item
  resource :delivery
  resources :item
  resource :order_item
  resource :order

#管理者
  namespace :admin do
    resources :orders
    resources :genres
    resources :items
    resources :customer
  end
end
