class Restaurant < ActiveRecord::Base
  attr_accessible :address, :category, :name, :phone_number, :rating, :restaurant_url, :website

  def populate_info
    raise Exception if restaurant_url.nil?


  end

end
