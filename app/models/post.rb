class Post < ActiveRecord::Base

  has_many :votes
  has_many :downvotes
  belongs_to :users
  validate :website_has_correct_format
  before_save :check_url


  def website_has_correct_format
    errors.add(:post_url, "Wrong post_url format please start with https:// or http://") unless post_url.downcase.start_with?('https://', 'http://')
  end

  def check_url
    post = Post.where(:post_url => self.post_url).first
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
