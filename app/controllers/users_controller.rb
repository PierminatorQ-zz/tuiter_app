class UsersController < ApplicationController
    def show       
        @user = User.find(params[:id])
        @friend = @user.followers.find_by(follower: current_user)
        @relation = Friend.where(followed_id: @user).where(follower_id: current_user).first
        #byebug
    end


end