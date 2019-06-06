Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/homepage', to: 'pages#homepage'
  resources :products, only: [:index, :show], path: 'make-up' do
    resources :basket_items, only: [:create]
  end
  resources :brands, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
