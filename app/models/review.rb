class Review < ActiveRecord::Base
  attr_accessible :content, :cool_count, :funny_count, :hrid, :rating, :title, :useful_count
end
