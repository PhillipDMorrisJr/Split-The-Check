class Restaurant < ApplicationRecord
	
	validates :name, :location presence: true
	belongs_to :user

	def self.search(search)
		where("name LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%")
	end

  	def upvote
         count = 0
         @vote_histories.each do |vote|
          if(vote.upvote)
           count = count + 1
          end
	  return count
         end
         return count
	end

  
  	def downvote
         count = 0
         @vote_histories.each do |vote|
          if(vote.upvote == false)
           count = count - 1
          end
	  return count
         end
         return count
	end
        
end
