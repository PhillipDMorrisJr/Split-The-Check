class VoteHistory < ApplicationRecord
	validates :user_id, :restaurant, presence: true
	belongs_to :restaurant
        belongs_to :user
end

