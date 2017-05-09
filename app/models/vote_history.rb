class VoteHistory < ApplicationRecord
	validates :name, :user, :restaurant, :upvote, presence: true
	belongs_to :restaurant
end
