ActiveAdmin.register User do

  index do
    selectable_column
    column "Nombre", :name
    column "email", :email
    #column "imagen", :profile_pic
    column "Seguidos", :friends_count
    column "Tweets", :tweets_count
    column "likes", :likes_given
    column "Retweets", :retweets_count
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name, :profile_pic
  #
  # or
  #
  #permit_params do
  #   permitted = [:name, :email, :created_at, :profile_pic, :user.following.count, :user.tweets.count, :user.tweets.likes.count, :user.tweets.retweets.count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
 #end
  
end
