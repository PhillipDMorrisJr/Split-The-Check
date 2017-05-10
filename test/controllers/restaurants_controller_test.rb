require 'test_helper'



class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do

    @restaurant = restaurants(:one)
    @comment = comments(:one)

  end

  test "should get index" do

    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_redirected_to new_user_session_url
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should increment up_votes" do
   sign_in users(:one)
   initial_upvote_value = @restaurant.up_vote
   patch upvote_restaurant_path(@restaurant)
   @restaurant.reload
   assert_equal initial_upvote_value+1, @restaurant.up_vote
   assert_redirected_to new_user_session_url
  end

  test "should decrement down_votes" do
   initial_downvote_value = @restaurant.up_vote
   patch downvote_restaurant_path(@restaurant)
   @restaurant.reload
   assert_equal initial_downvote_value-1, @restaurant.down_vote
   assert_redirected_to new_user_session_url
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end
  test "should search restaurant by name" do 
    get restaurants_url , {search: "Ryans"}


    assert_response :success
  end

  test "should search restaurant by location" do
    get restaurants_url , {search: "Douglasville"}
    
    assert_response :success 
  end
  test "user should comment on restaurant" do
 
   sign_in users(:one)
   initial_comment_value = @comment.body
   @comment.save
   post comments_path, comment: {body: @comment.body, user: @comment.user}, restaurant_id: @restaurant.id
   assert_redirected_to restaurant_url(@restaurant)
  end
  
end
