class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.remove :up_vote
      t.remove :down_vote

      t.timestamps
    end
  end
end
