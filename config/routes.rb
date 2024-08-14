Rails.application.routes.draw do
  post 'upvote/:post_slug', to: 'votes#upvote', as: 'upvote'
  post 'downvote/:post_slug', to: 'votes#downvote', as: 'downvote'  
  get 'query', to: 'search#query', as: 'search_query'

  resources :posts do
    member do
      get "upvote", to: "posts#upvote"
      get "downvote", to: "posts#downvote"
    end
  end
  get 'post_links/:id', to: 'posts#post_links', as: 'post_links'
  get :post_links, controller: :posts
  get 'topic_follow_toggle/:id', to: 'topics#topic_follow_toggle', as: 'topic_follow_toggle'
  resources :topics, only: [:index, :show]
  get 'topic-autocomplete', to: 'topics#autocomplete'
  devise_for :users

  # resources :post_social_shares
  # resources :social_connections
  # resources :vote_counts
  # resources :votes
  # resources :followings
  # resources :themes


  get   'about', to: 'static#about'
  get   'contact', to: 'static#contact'
  get   'privacy', to: 'static#privacy'

  get 'smarties', to: 'users#index', as: 'smarties'
  
  get 'follow/:following_id', to: 'users#follow_toggle', as: 'follow_toggle'
  get ':id', to: 'static#profile', as: 'profile'
  root to: 'static#index'

  # resources :topic_followings
  # resources :user_images
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
