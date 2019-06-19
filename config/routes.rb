Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#homepage'
  get '/homepage', to: 'pages#homepage'
  get '/freebies', to: 'pages#freebies'
  # TEMP ROUTES FOR INSIDER
  get '/dashboard', to: 'pages#dashboard'
  get '/insider', to: 'pages#insider'
  # TEMP ROUTES FOR INSIDER
  get '/videos', to: 'pages#videos'
  get '/influencer_video', to: 'pages#influencer_video'
  get '/influencers', to: 'pages#influencers'
  get '/about_us', to: 'pages#about_us'
  get '/questions_and_answers', to: 'pages#questions_and_answers'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions', as: :terms_and_conditions
  get '/shipping', to: 'pages#shipping', as: :shipping
  get '/sale_terms', to: 'pages#sale_terms', as: :sale_terms
  get '/cookies_policy', to: 'pages#cookies_policy', as: :cookies_policy
  get '/returns_policy', to: 'pages#returns_policy', as: :returns_policy
  get '/privacy_policy', to: 'pages#privacy_policy', as: :privacy_policy
  resources :products, only: [:index, :show]
  resources :tutorials, except: [:index]
  resources :lookbooks, except: [:index]
  resources :users, only: [], path: 'influencers' do
    resources :lookbooks, only: [:index]
    resources :tutorials, only: [:index, :show]
    resources :question_answers
    member do
      get '/make_up', to: 'users#make_up'
    end
  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  resources :users, only: [:show, :index] do
    get 'dashboard', to: 'users#dashboard'
    get 'my_orders', to: 'users#my_orders'
    get 'my_products', to: 'users#my_products'
    get 'refer_a_friend', to: 'users#refer_a_friend'
    get 'wishlist', to: 'users#wishlist'
    get 'account_details', to: 'users#account_details'
    get 'preference_centre', to: 'users#preference_centre'
    member do
      patch '/publish', to: 'users#publish'
      patch '/unpublish', to: 'users#unpublish'
    end
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

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
    resources :brands, only: [:new, :edit, :create, :update, :destroy]
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
