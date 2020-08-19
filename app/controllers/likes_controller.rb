class LikesController < ApplicationController
    before_action :find_tweet
    before_action :find_like, only: [:destroy]


    def create
        if already_liked?
          flash[:notice] = "Ya le diste Me Gusta"
        else
          @tweet.likes.create(user_id: current_user.id)
        end
        redirect_to root_path
        #redirect_to post_path(@post)
      end

      def destroy
        if !(already_liked?)
          flash[:notice] = "No es posible retirar el Like"
        else
          @like.destroy
        end
        redirect_to root_path
        #redirect_to post_path(@post)
      end

      def find_like
        @like = @tweet.likes.find(params[:id])
     end


   private

   def already_liked?
    Like.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end

   def find_tweet
     @tweet = Tweet.find(params[:tweet_id])
   end
 end
