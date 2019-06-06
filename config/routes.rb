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
  resources :products, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
