class AddUserIdToDownvotes < ActiveRecord::Migration
  def change
    add_column :downvotes, :user_id, :integer
  end
end
