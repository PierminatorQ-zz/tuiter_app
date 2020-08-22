Rails.application.routes.draw do
  #get 'home/index'
  resources :tweets
  devise_for :users, controllers: { registrations: 'users/registrations'}
  
  resources :users, only: [:show] do
    resources :friends, only: [:create]
    
  end

  resources :friends, only: [:destroy]
  
  root "home#index"
  
  resources :tweets do
    resources :likes
    post 'retweet', to: "tweets#retweet"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
