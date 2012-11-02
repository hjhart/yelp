class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :content
      t.integer :useful_count
      t.integer :funny_count
      t.integer :cool_count
      t.string :hrid

      t.timestamps
    end
  end
end
