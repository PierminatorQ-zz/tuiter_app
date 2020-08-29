class Tweet < ApplicationRecord
include ActionView::Helpers::UrlHelper

  before_save :add_hashtags
  validates :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  paginates_per 5

  def add_hashtags
    new_array = []
    self.content.split(" ").each do |word|
      if word.start_with?("#") # #latam
        word_parsed = word.sub '#','%23'
        word = link_to(word, Rails.application.routes.url_helpers.root_path+"?search="+word_parsed )
      end
      new_array.push(word)
    end
    self.content = new_array.join(" ")
  end
  
  def count_rt
    Tweet.where(rt_ref: self.id).count
  end

  def is_retweet?
    rt_ref ? true : false
  end

  def tweet_ref
    Tweet.find(self.rt_ref)
  end

  
end
