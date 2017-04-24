require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { down_vote: @restaurant.down_vote, location: @restaurant.location, name: @restaurant.name, up_vote: @restaurant.up_vote } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should increment up_votes" do
   initial_upvote_value = @restaurant.up_vote
   patch upvote_restaurant_path(@restaurant)
   @restaurant.reload
   assert_equal initial_upvote_value+1, @restaurant.up_vote
   assert_redirected_to restaurants_path
  end

  test "should decrement down_votes" do
   initial_downvote_value = @restaurant.up_vote
   patch downvote_restaurant_path(@restaurant)
   @restaurant.reload
   assert_equal initial_downvote_value-1, @restaurant.down_vote
   assert_redirected_to restaurants_path
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end
end
