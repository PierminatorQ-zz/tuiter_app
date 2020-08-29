class HomeController < ApplicationController
  def index
      if signed_in?
        @user_id= Friend.where(follower_id:current_user).pluck(:followed_id)
        #Scope for only_followers
        @tweets = Tweet.all.order("created_at DESC").where(user_id: @user_id).page params[:page]
        @tweet = Tweet.new
      else
        @tweets = Tweet.all.order("created_at DESC").page params[:page]
        @tweet = Tweet.new
      end
  end

  def all_tweets
    @tweets = Tweet.all.order("created_at DESC").page params[:page]
    @tweet = Tweet.new
    render :template => "home/index"
  end




end
