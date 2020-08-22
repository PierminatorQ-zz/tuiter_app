class FriendsController < ApplicationController

    def create 
        other_user= User.find(params[:user_id])
        @friend = Friend.new(follower_id: current_user.id, followed_id: other_user.id)
        @friend.save
        redirect_to root_path
        #redirect_to user_path(other_user)
    end

    def destroy 
        
        @friend= Friend.find_by(followed_id: params[:id])
        @friend.destroy
        redirect_to root_path
        #redirect_to user_path(@friend.followed_id)

    end
end
