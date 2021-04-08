Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  Rails.application.routes.draw do
    resources :relationships, only: [:create, :destroy]
  end  
  resources :labos, only: [:new]
  resources :posts do
    resources :comments, only: [:create]
    resources :tags, only: [:index]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
