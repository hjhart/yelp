class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :website
      t.string :phone_number
      t.string :address
      t.string :rating
      t.string :restaurant_url

      t.timestamps
    end
  end
end
