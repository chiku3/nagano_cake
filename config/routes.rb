Rails.application.routes.draw do
  root "homes#top"

  get 'homes/about' => "homes#about"

  resource :customers, only:[:edit, :update]
  get 'customers/my_page' => "customers#show"
  get 'customers/unsubscribe' => "customers#unsubscribe"
  get 'customers/withdraw' => "customers#withdraw"

  resources :items, only:[:index, :show]

  delete 'cart_items/destroy_all' => "cart_items#destroy_all"
  resources :cart_items, only:[:index, :update, :destroy, :create]

  post 'orders/confirm' => "orders#confirm"
  get 'orders/complete' =>"orders#complete"
  resources :orders, only:[:new, :create, :index, :show]

  resources :addresses, only:[:index, :edit, :create, :update, :destroy]

  namespace :admin do
    resources :orders,only:[:show, :update]
    resources :order_details,only:[:update]
    resources :customers,only:[:index, :show, :edit, :update]
    resources :genres,only:[:index, :create, :edit, :update]
    resources :items,only:[:index, :new, :create, :show, :edit, :update]
    get 'homes/top' => "admin/homes"
  end


  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
