class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.create(params[:comment].permit(:body))
		@comment.user = current_user
		@comment.save
		redirect_to restaurant_path(@restaurant), notice: "Your comment was successfully posted."
	end


end
