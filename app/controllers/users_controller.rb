class UsersController < ApplicationController
    def show       
        @user = User.find(params[:id])
        @friend = @user.followers.find_by(follower: current_user)
        @relation = Friend.where(followed_id: @user).where(follower_id: current_user).first
        #byebug
        #buscando hashtags
        @hasha = Tweet.where('content LIKE ?', '%#%').pluck(:content)
        @hash = check_hash(@hasha)
        @count= count_hash(@hash)
        
    end

    def check_hash(hasha)
        final=[]
        hasha.each do |hasht|
            temp=hasht.split(" ")
            temp.map{ |r| 
                if r.include?("#") 
                    three = r[/[#][a-z]*\b/]
                     final.push(three)
                end }
        end
    final
    
    end

    def count_hash(number)
        number.each_with_object(Hash.new(0)) do |element, hash|
            hash[element] += 1
         end
    end


end