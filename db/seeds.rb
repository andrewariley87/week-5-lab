# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
User.create(:user_name => 'Andy', :email => 'aar00734@aol.com', :password => 'pacers31')

Post.create(:title => "First Post", :summary => "This is the first post", :post_url => "http://google.com", :user_id => 1)
Post.create(:title => 'Second Post', :summary => 'This is the second post', :post_url => 'http://espn.com', :user_id => 1)
Post.create(:title => 'Third Post', :summary => 'This is the third post', :post_url => 'http://nbc.com', :user_id => 1)
=======
User.create!(:user_name => 'Andy', :email => 'aar00734@aol.com', :password => 'pacers31')
Subreddit.create!(:name => 'LOL')

Post.create!(:title => "First Post", :summary => "This is the first post", :post_url => "http://google.com", :user_id => 1, :subreddit_id => 1)
Post.create!(:title => 'Second Post', :summary => 'This is the second post', :post_url => 'http://espn.com', :user_id => 1, :subreddit_id => 1)
Post.create!(:title => 'Third Post', :summary => 'This is the third post', :post_url => 'http://nbc.com', :user_id => 1, :subreddit_id => 1)
>>>>>>> finale
