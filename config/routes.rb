Rails.application.routes.draw do

  root 'users#index'
  
  resources :users do
    resources :lists
  end

  resources :properties do
    resources :images
  end
  # get '/properties/:id/images' => 'images#index', as: :images
  # get '/properties/:id/images/new' => 'images#new', as: :new_image
  # post '/properties/:id/images' => 'images#create' 
  # get '/properties/:id/images/:id' => 'images#show', as: :image
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
