class AddSubredditNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :subreddit_name, :string
  end
end
