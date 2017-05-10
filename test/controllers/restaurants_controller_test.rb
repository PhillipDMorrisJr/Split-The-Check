require 'test_helper'



class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do

    @restaurant = restaurants(:one)

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
    @restaurant.reload

    assert_redirected_to restaurant_url(Restaurant.last)
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
   post comments_path_url, comment: {body: @comment.body, user: @comment.user}, restaurant_id: @restaurant.id
   assert_redirected_to restaurant_url(@restaurant)
  end
  
end
