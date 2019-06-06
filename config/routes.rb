Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/homepage', to: 'pages#homepage'
  resources :products, only: [:index, :show], path: 'make-up' do
    resources :basket_products, only: [:create]
  end
  resources :basket_products, only: [:update, :destroy]
  resources :brands, only: [:index, :show]
  get '/bag', to: 'baskets#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
