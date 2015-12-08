PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  resources :posts, expect: [:destroy] do
    resources :comments, only: [:create, :show]
  end
end
