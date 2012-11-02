class AddNumReviewsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :num_of_reviews, :integer
  end
end
