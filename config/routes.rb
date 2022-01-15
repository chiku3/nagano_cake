Rails.application.routes.draw do
  root "homes#top"
  
  devise_for :customers
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/complete'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'cart_items/updatee'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'customers/withdraw'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'items/index'
  get 'items/show'
  get 'homes/top'
  get 'homes/about'
  

  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
