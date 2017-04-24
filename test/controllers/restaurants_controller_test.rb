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

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { down_vote: @restaurant.down_vote, location: @restaurant.location, name: @restaurant.name, up_vote: @restaurant.up_vote } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
test "should search restaurant by name" do 
    get restaurant_url , {search: "Ryans"}
    assert_equals 1, assigns[:restaurants.count]
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should search restaurant by location" do
    get restaurant_url , {search: "Douglasville"}
    assert_equals 2, assigns[:restaurants.count]
    assert_redirected_to restaurant_url(@restaurant)
  end
  
end
