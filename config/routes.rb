 PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, expect: [:destroy] do
    member do
      post :vote
    end
    
    resources :comments, only: [:create, :show] do
      member do
        post :vote
      end
    end
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create, :edit, :update, :show]
end
  

