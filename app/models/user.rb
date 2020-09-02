class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, foreign_key: "followed_id", class_name: "Friend"
  has_many :following, foreign_key: "follower_id", class_name: "Friend"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def to_s
          name
         end

        

         def is_following?(other_user)
            other_user.followers.find_by(follower_id:self.id)
         end


         def friends_count
            Friend.where(follower_id:self.id).count
         end

         def tweets_count
            Tweet.where(user_id:self.id).count
         end

         def likes_given
            self.likes.count
         end
         
         def retweets_count
            Tweet.where(user_id:self.id).where.not(rt_ref: nil).count
         end


         def self.authenticate(email, password)
            user= User.find_for_authentication(email: email)
            user&.valid_password?(password) ? user : nil
         end
         
         def rt_count
            self.tweets.where.not(rt_ref: nil).count
         end

         

         
end
