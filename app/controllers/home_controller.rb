class HomeController < ApplicationController
  def index
      @user_id= Friend.where(follower_id:current_user.id).pluck(:followed_id)
      @tweets = Tweet.all.order("created_at DESC").where(user_id: @user_id).page params[:page]
      @tweet = Tweet.new
  end

end
