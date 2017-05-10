class RemoveDownvoteFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :downvote, :integer
  end
end
