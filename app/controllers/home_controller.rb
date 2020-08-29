class HomeController < ApplicationController
  def index
      if signed_in?
          if( params[:search] && !params[:search].empty? )
              @tweets = Tweet.all.where("content LIKE ?", "%#{params[:search]}%").order(created_at: :desc).page params[:page]
          else
              #Scope for only_followers
              @tw_user=Tweet.all.where(user_id: current_user.id)
              @user_id= Friend.where(follower_id:current_user).pluck(:followed_id)
              @tweets = Tweet.all.where(user_id: @user_id).or(@tw_user).order("created_at DESC").page params[:page]
          end

        #create a new tweet
        @tweet = Tweet.new
      else
        #scope for all tweets
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
