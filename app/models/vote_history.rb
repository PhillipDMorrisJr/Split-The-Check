class VoteHistory < ApplicationRecord
	validates :user, :restaurant, :upvote presence: true
	belongs_to :user, :restaurant
end
end
