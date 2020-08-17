class User < ApplicationRecord
  has_many :tweets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

         def to_s
          name
         end
=======
>>>>>>> dea441acba9cf2a2c2ad103170fec04e8ca14dae
end
