require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  setup do

    @restaurant = restaurants(:one)

  end

  test "should have no upvote and one downvote" do
    patch "/restaurants/#{@restaurant.id}/downvote"
    assert_equal 0, @restaurant.upvote
    assert_equal 1, @restaurant.downvote
  end

  test "should have mixed upvotes and downvotes" do
  #  patch upvote_restaurant_path(@restaurant)
   # patch upvote_restaurant_path(@restaurant)
    #patch upvote_restaurant_path(@restaurant)
    #patch downvote_restaurant_path(@restaurant)
    #patch downvote_restaurant_path(@restaurant)
    #assert_equal 3, @restaurant.upvote
    #assert_equal 2, @restaurant.downvote
  end

end
