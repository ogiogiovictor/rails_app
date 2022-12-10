Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :users
  #root to: "home#index"
  root to: 'users#index'

######################3 API END POINT ROUTE ########################3######
namespace :api, defaults: { format: :json } do
  post 'auth/login', to: 'authentication#login'
  resources :users, only: %i[create update destroy] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :create]
  end
 end
end

######################3 NORMAL ROUTE WITH VIEWS ########################3######
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[new create]
    end
  end
  # resources :users, only: [:index, :show] do 
  #   resources :posts, only: [:index, :show]
  # end
end

