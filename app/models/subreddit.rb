class Subreddit < ActiveRecord::Base

  has_many :posts
  belongs_to :user
  before_save :paramertize_name
  has_many :comments, :as => :commentable

  def paramertize_name
    self.name = self.name.downcase
  end

  def to_param
    name
  end

end
