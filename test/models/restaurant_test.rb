require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  setup do

    @restaurant = restaurants(:one)
    

  end

  test "should have one upvote and no downvote" do
    @vote = vote_histories(:one)   
    @vote.save
    assert_equal 1, @restaurant.upvote
    assert_equal 0, @restaurant.downvote
  end

  test "should have no upvote and one downvote" do
    @vote = vote_histories(:two)   
    @vote.save
    assert_equal 0, @restaurant.upvote
    assert_equal 1, @restaurant.downvote
  end

  test "should have mixed upvotes and downvotes" do
    @vote = vote_histories(:two)  
    @vote1 = vote_histories(:two)   
    @vote2 = vote_histories(:one)
    @vote3 = vote_histories(:one)    
    @vote4 = vote_histories(:one)        
    @vote.save
    @vote1.save
    @vote2.save
    @vote3.save
    @vote4.save
    assert_equal 3, @restaurant.upvote
    assert_equal 2, @restaurant.downvote
  end

end
