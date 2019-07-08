Rails.application.routes.draw do
  namespace :admin do
    get 'influencers/new'
  end
  devise_for :users
  root to: 'pages#homepage'
  get '/homepage', to: 'pages#homepage'
  get '/freebies', to: 'pages#freebies'
  get '/contact_us', to: 'pages#contact_us'
  # TEMP ROUTES FOR INSIDER
  get '/dashboard', to: 'pages#dashboard'
  get '/insider', to: 'pages#insider'
  # TEMP ROUTES FOR INSIDER
  get '/videos', to: 'pages#videos'
  get '/influencer_video', to: 'pages#influencer_video'
  get '/about_us', to: 'pages#about_us', as: :about_us
  get '/careers', to: 'pages#careers', as: :careers
  get '/frequently_asked_questions', to: 'pages#frequently_asked_questions'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions', as: :terms_and_conditions
  get '/shipping', to: 'pages#shipping', as: :shipping
  get '/sale_terms', to: 'pages#sale_terms', as: :sale_terms
  get '/cookies_policy', to: 'pages#cookies_policy', as: :cookies_policy
  get '/returns_policy', to: 'pages#returns_policy', as: :returns_policy
  get '/privacy_policy', to: 'pages#privacy_policy', as: :privacy_policy
  get '/checkout', to: 'orders#new'
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
  resources :orders, only: [:create, :show]
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  resources :users, only: [:show, :index], path: 'influencers' do
    get 'uploads', to: 'users#uploads'
    get 'dashboard', to: 'users#dashboard'
    get 'share', to: 'users#share'
    get 'showroom', to: 'users#showroom'
    get 'analytics', to: 'users#analytics'
    get 'my_orders', to: 'users#my_orders'
    get 'my_products', to: 'users#my_products'
    get 'refer_a_friend', to: 'users#refer_a_friend'
    get 'wishlist', to: 'users#wishlist'
    get 'account_details', to: 'users#account_details'
    get 'preference_centre', to: 'users#preference_centre'
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
    resources :influencers, only: [:new, :create, :edit, :update] do
      member do
        patch '/publish', to: 'influencers#publish'
        patch '/unpublish', to: 'influencers#unpublish'
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
