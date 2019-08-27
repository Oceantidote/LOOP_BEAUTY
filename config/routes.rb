Rails.application.routes.draw do
  namespace :admin do
    get 'influencers/new'
  end
  devise_for :users
  root to: 'pages#homepage'
  get '/homepage', to: 'pages#homepage'
  get '/contact_us', to: 'pages#contact_us'
  # TEMP ROUTES FOR INSIDER
  get '/dashboard', to: 'pages#dashboard'
  get '/insider', to: 'pages#insider'
  # TEMP ROUTES FOR INSIDER
  get '/videos', to: 'pages#videos'
  get '/influencer_video', to: 'pages#influencer_video'
  get '/all_videos', to: 'tutorials#all_videos'
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

  resources :wishlist_products, except: [:new, :create] do
    member do
      post '/add_to_bag', to: 'wishlist_products#add_to_bag'
    end
  end
  # WISHLIST TEST
  resources :freebies, only: [:index]
  resources :tutorials, except: [:index]
  resources :lookbooks, except: [:index]
  resources :users, only: [], path: 'influencers' do
    resources :lookbooks, only: [:index] do
      member do
        post '/add_to_bag', to: 'lookbooks#add_to_bag'
      end
    end
    resources :tutorials, only: [:index, :show]
    resources :question_answers
    member do
      get '/make_up', to: 'users#make_up'
    end
  end
  resources :orders, only: [:create, :show] do
    get 'order_success', to: 'orders#order_success'
  end

  resources :users, only: [:show, :index, :update], path: 'influencers' do
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
    patch 'change_password', to: 'users#change_password'
    patch 'newsletter', to: 'users#newsletter'
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  # ADMIN ROUTES BELOW

  namespace :admin do
    get 'change_banner', to: 'banners#change_banner'
    post 'change_banner', to: 'banners#change'
    get 'change_offer_banner', to: 'offer_banners#change_offer_banner'
    post 'change_offer_banner', to: 'offer_banners#change'
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
    resources :brands, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :insider_articles, only: [:new, :edit, :create, :update, :destroy, :index] do
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
    resources :products, except: [:show] do
      resources :product_benefits, only: [:create]
      resources :shades, only: [:create]
      resources :customer_reviews, only: [:index, :destroy]
      resources :insider_reviews, only: [:index, :destroy]
    end
    resources :product_benefits, only: [:destroy]
    resources :shades, only: [:update, :destroy]
    resources :freebies, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :home_banners
    get ':id/portal', to: 'pages#portal'
  end

  # ADMIN ROUTES ABOVE

  resources :insider_articles, only: [:show, :index]
  resources :products, only: [:index, :show], path: 'make-up' do
    resources :wishlist_products, only: [:new, :create]
    resources :customer_reviews, only: [:create]
    resources :insider_reviews, only: [:create]
    member do
      post 'my_product', to: 'products#my_product'
    end
    resources :basket_products, only: [:create]
  end
  resources :basket_products, only: [:update, :destroy] do
    member do
      patch '/set_credit_purchase', to: 'basket_products#set_credit_purchase'
    end
  end
  resources :brands, only: [:index, :show]
  resources :addresses, only: [:create, :destroy]

  get '/bag', to: 'baskets#show'
  patch '/discount', to: 'baskets#add_discount_code'
  patch '/remove_discount', to: 'baskets#remove_discount_code'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
