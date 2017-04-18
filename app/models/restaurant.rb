class Restaurant < ApplicationRecord
	validates :name, :location, :up_vote, :down_vote, presence: true

	def self.search(search)
		where("name LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%")
	end
end
