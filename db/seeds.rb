# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(:title => "First Post", :summary => "This is the first post", :post_url => "http://google.com")
Post.create(:title => 'Second Post', :summary => 'This is the second post', :post_url => 'http://espn.com')
Post.create(:title => 'Third Post', :summary => 'This is the third post', :post_url => 'http://nbc.com')
