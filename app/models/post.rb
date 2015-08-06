class Post < ActiveRecord::Base

  has_many :votes
  has_many :downvotes
  belongs_to :user
  validate :website_has_correct_format
  before_save :check_url
  belongs_to :subreddit
  has_many :comments, :as => :commentable


  def website_has_correct_format
    errors.add(:post_url, "Wrong post_url format please start with https:// or http://") unless post_url.downcase.start_with?('https://', 'http://')
  end

  def check_url
    post = Post.where("post_url = ? and id != ?", post_url, id.to_s).first
      if post
        post.votes.create
        self.errors.add(:unique_url, 'This is not a unique url, url already in use')
        false
        #post.inspect
      else
        true
      end
  end

end
