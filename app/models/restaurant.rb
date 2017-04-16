class Restaurant < ApplicationRecord
	validates :name, :location, :up_vote, :down_vote, presence: true
end
