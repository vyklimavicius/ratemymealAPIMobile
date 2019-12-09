Rails.application.routes.draw do
    namespace :api do
    namespace :v1 do
      resources :users
      resources :restaurants
      resources :ratings
      post '/login', to: "autho#login"
      get '/reviews', to: 'reviews#index'
      post '/reviews', to: 'reviews#create'
      get '/reviews/:id', to: 'reviews#show'
  end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
