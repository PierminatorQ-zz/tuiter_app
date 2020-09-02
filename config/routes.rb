Rails.application.routes.draw do
  #get 'api/news'

  scope '/api' do
    get '/news', to: 'api#news', as: 'api_news'
    get '/:date1/:date2', to: 'api#tweets_by_dates', as: 'tweets_by_dates'
    post '/tweets', to: 'api#create_tweet'
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #get 'home/index'
  resources :tweets
  devise_for :users, controllers: { registrations: 'users/registrations'}
  
  resources :users, only: [:show] do
    resources :friends, only: [:create]
    
  end

  resources :friends, only: [:destroy]
  get 'all_tweets', to: 'home#all_tweets', as: 'all_tweets'
  root "home#index"
  
  resources :tweets do
    resources :likes
    post 'retweet', to: "tweets#retweet"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
