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
end
