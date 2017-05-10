class RemoveUpvoteFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :upvote, :integer
  end
end
