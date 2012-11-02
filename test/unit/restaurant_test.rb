require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "zee truth" do
    restaurant = Restaurant.new :restaurant_url => "manor-coffee-shop-san-francisco"
    content = restaurant.populate_info
    assert content.class, String
  end

  test "getting reviews" do
    restaurant = Restaurant.new :restaurant_url => "fruition-restaurant-denver"
    assert restaurant.populate_review_info, true

  end
end
