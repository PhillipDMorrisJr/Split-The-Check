class Restaurant < ApplicationRecord
	
	validates :name,:location, :up_vote, :down_vote, presence: true
	belongs_to :user
        has_many :vote_histories

	def self.search(search)
		where("name LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%")
	end
        def new
         @vote_histories = VoteHistory.new
        end
  	def upvote
         count = 0
         @vote_histories.all.each do |vote|
          if(vote.upvote)
           up_vote = up_vote + 1
          end
	  return count
         end
         return count
	end

  
  	def downvote
         count = 0
         @vote_histories.all.each do |vote|
          if(vote.upvote == false)
           count = count - 1
          end
	  return count
         end
         return count
	end
        
end
