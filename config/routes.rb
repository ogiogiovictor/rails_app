Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :users
  #root to: "home#index"
  root to: 'users#index'

######################3 API END POINT ROUTE ########################3######
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments 
          resources :likes
        end
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

#  namespace 'api' do
#       resources :posts
#     end  
#     resources :posts, only: %i[index new create show] do
#       namespace 'api' do
#         resources :comments
#       end
#     end