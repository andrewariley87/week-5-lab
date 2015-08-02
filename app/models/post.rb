class Post < ActiveRecord::Base

  has_many :votes
  has_many :downvotes
  validate :website_has_correct_format


  def website_has_correct_format
  errors.add(:post_url, "Wrong post_url format please start with https:// or http://") unless post_url.downcase.start_with?('https://', 'http://')
  end

end
