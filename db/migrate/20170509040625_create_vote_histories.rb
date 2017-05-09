class CreateVoteHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_histories do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.boolean :upvote

      t.timestamps
    end
  end
end
