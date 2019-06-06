Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/homepage', to: 'pages#homepage'
  namespace :admin do
    resources :lookbooks, only: [:index] do
      member do
        patch '/approve', to: 'admin/lookbooks#approve'
        patch '/reject', to: 'admin/lookbooks#reject'
      end
    end
    resources :tutorials, only: [:index] do
      member do
        patch '/approve', to: 'admin/tutorials#approve'
        patch '/reject', to: 'admin/tutorials#reject'
      end
    end
  end
  resources :products, only: [:index, :show], path: 'make-up' do
    resources :basket_products, only: [:create]
  end
  resources :basket_products, only: [:update, :destroy]
  resources :brands, only: [:index, :show]
  get '/bag', to: 'baskets#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
