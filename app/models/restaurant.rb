class Restaurant < ApplicationRecord
	belongs_to :user
        has_many :vote_histories
	has_many :comments

	def self.search(search)
		where("name LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%")
	end
        def new
         @vote_histories = VoteHistory.new
        end
  	def upvote
         count = 0
         vote_histories.each do |vote|
          if(vote.upvote)
           count = count + 1
          end
         end
         return count
	end

  
  	def downvote
         count = 0
         vote_histories.each do |vote|
          if(vote.upvote == false)
           count = count + 1
          end
         end
         return count
	end
        
end
