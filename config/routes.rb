Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/homepage', to: 'pages#homepage'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions', as: :terms_and_conditions
  get '/shipping', to: 'pages#shipping', as: :shipping
  get '/sale_terms', to: 'pages#sale_terms', as: :sale_terms
  get '/cookies_policy', to: 'pages#cookies_policy', as: :cookies_policy
  get '/returns_policy', to: 'pages#returns_policy', as: :returns_policy
  get '/privacy_policy', to: 'pages#privacy_policy', as: :privacy_policy
  get '/dashboard', to: 'users#dashboard'
  resources :products, only: [:index, :show]
  resources :tutorials, except: [:index]
  resources :lookbooks, except: [:index]
  resources :users, only: [], path: 'influencers' do
    resources :lookbooks, only: [:index]
    resources :tutorials, only: [:index]
  end
  namespace :admin do
    resources :lookbooks, only: [:index] do
      member do
        patch '/approve', to: 'lookbooks#approve'
        patch '/reject', to: 'lookbooks#reject'
      end
    end
    resources :tutorials, only: [:index] do
      member do
        patch '/approve', to: 'tutorials#approve'
        patch '/reject', to: 'tutorials#reject'
      end
    end
    resources :insider_articles, only: [:new, :edit, :create, :update, :destroy] do
      member do
        patch '/publish', to: 'insider_articles#publish'
        patch '/unpublish', to: 'insider_articles#unpublish'
      end
    end
  end
  resources :insider_articles, only: [:show, :index]
  resources :products, only: [:index, :show], path: 'make-up' do
    resources :basket_products, only: [:create]
  end
  resources :basket_products, only: [:update, :destroy]
  resources :brands, only: [:index, :show]
  get '/bag', to: 'baskets#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
