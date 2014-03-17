Chuych::Application.routes.draw do

 
  get "visitor/new"
  get "visitor/create"
  resources :churches do
    resources :favorites, only: [:create, :destroy]

      resources :posts, only: [:index, :edit, :show, :new, :create, :edit] do
      get '/up-vote', to: 'votes#up_vote', as: :up_vote # havent implemented voting yet.
      get '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  end

  resources :posts, only: [:index]
  resources :welcome, only: [:index, :new] 
  resources :favorites, only: [:index]
  resources :visitors, only: [:new, :create]

  root :to => 'welcome#new'

  # devise_for :users, controllers: {omniauth_callbacks:'users/omniauth_callbacks'}
  # added the below for twitter
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations'}
  resources :users, only: [:show]
  
end

  # resources :churches,  only: [:index, :create, :new, :show] do
  #   resources :favorites, only: [:create, :destroy]
  #   #nest post here so they are associated to a church. this way individuals can really promote a church.

  # resources :posts, only: [:index, :edit, :show, :new, :create, :edit]
  
  # end
