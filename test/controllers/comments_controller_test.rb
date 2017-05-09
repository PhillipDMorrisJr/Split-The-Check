require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

setup do

    @comment = comments(:one)
    @restaurant = restaurants(:one)

  end



#test "user should comment on restaurant" do

  	#sign_in users(:one)
  	#post :create, comment: {body: @comment.body, user: @comment.user }, restaurant_id: @restaurant.id
  	#assert_redirected_to restaurant_path(@restaurant)
  #end
end