class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_id
      t.string :public_name
      t.integer :friends
      t.integer :reviews
      t.integer :tips
      t.integer :local_photos
      t.string :yelping_since
      t.integer :useful_votes
      t.integer :funny_votes
      t.integer :cool_votes

      t.timestamps
    end
  end
end
