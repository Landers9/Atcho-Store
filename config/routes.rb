Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#index', as: "root"
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  post '/send_contact_message', to: 'home#send_contact_message', as: 'send_contact_message'
  get '/news', to: 'home#news', as: 'news'
  resources :products, only: %i[ index show ]
  resources :carts, only: %i[ index update destroy ]
  get '/cart/:product_id', to: 'carts#create', as: 'add_cart'
  get '/checkout', to: 'home#checkout', as: 'checkout'
  put '/checkout/:id', to: 'home#checkout_final', as: 'checkout_final'
  get '/filter/:category', to: 'products#filter', as: 'filter'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
