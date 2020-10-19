Rails.application.routes.draw do
  root to: "customer/home#top"
  get "about" => "customer/home#about"
  devise_for :customers,controllers: {
    sessions: "customer_devises/sessions",
    registrations: "customer_devises/registrations",
    passwords: "customer_devises/passwords"
  }
  devise_for :admins,controllers: {
    sessions: "admin_devises/sessions"
  }
#お客様
  namespace :customer do
    resource :customer,only: [:show,:update] do
      get "customer/emend" => "customers#emend"
      get "customer/confirm" => "customers#confirm"
      put "customer/hide" => "customers#hide"
    end
    resource :cart_item,only: [:index,:create,:update,:destroy] do
      delete :destroy_all, on: :collection
    end
    resource :delivery,only: [:index,:edit,:create,:update,:destroy]
    resources :items,only: [:show,:index]
    resources :orders,only: [:new,:create,:index,:show] do
      get :finish, on: :collection
      get :confirm, on: :collection
      post :confirm, on: :collection
    end
    patch "/order_items/:id" => "order_items#update"
  end

#管理者
  namespace :admin do
    get "top" => "home#top"
    resources :orders,only: [:index,:show,:update]
    resources :genres,only: [:index,:edit,:create,:update]
    resources :items,expect: [:destroy]
    resources :customer,only: [:index,:edit,:show,:update]
  end
end
