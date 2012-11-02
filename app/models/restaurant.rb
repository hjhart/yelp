class Restaurant < ActiveRecord::Base
  include YelpScraper

  @deep_traverse = false
  @queue = :restaurants

  attr_accessible :address, :category, :name, :phone_number, :rating, :restaurant_url, :website, :num_of_reviews
  has_many :reviews

  def target_restaurant_url(offset = nil)
    if offset.nil?
      YELP_RESTAURANT_URL + restaurant_url
    else
      YELP_RESTAURANT_URL + restaurant_url + "?start=#{offset}"
    end
  end

  def populate_info
    raise Exception if restaurant_url.nil?

    content = YelpScraper.get_page_content(target_restaurant_url, @deep_traverse)
    parsed = Nokogiri::HTML(content)

    attributes = {}
    attributes[:name] = parsed.css('#bizInfoHeader h1').text.strip
    attributes[:category] = parsed.css('#cat_display').text.strip
    attributes[:address] = parsed.css('address').text.strip
    attributes[:phone_number] = parsed.css('#bizPhone').text.strip
    attributes[:rating] = parsed.css('div#bizRating meta[itemprop=ratingValue]').first['content']
    attributes[:website] = parsed.css('div#bizUrl').text.strip
    attributes[:num_of_reviews] = parsed.css('#bizRating .review-count span').text

    puts "The attributes for that restaurant:"
    ap attributes

    self.update_attributes!(attributes)
  end

  def populate_review_info
    if num_of_reviews.nil?
      puts "Number of reviews is not populated. Needed for offset calculation"
      populate_info
      self.reload
    end

    offset = 0
    while(offset <= num_of_reviews)

      raise Exception if restaurant_url.nil?

      content = YelpScraper.get_page_content(target_restaurant_url(offset))
      parsed = Nokogiri::HTML(content)

      parsed.css('li.review').each do |review|
        rv = Review.new :restaurant_id => self.id
        rv.parse_html_to_database(review)
      end

      offset += 40
    end
  end

  def self.perform(restaurant_id, deep_traverse=false)
    if restaurant_id.nil?
      puts "Restaurant ID was not specified for this queue"
      raise Exception
    end

    restaurant = Restaurant.find_by_restaurant_url(restaurant_id)
    @deep_traverse = deep_traverse

    if(restaurant)
      puts "The restaurant with id #{restaurant_id} already exists. Not updating information."
    else
      restaurant = Restaurant.new(:restaurant_url => restaurant_id)
      restaurant.populate_review_info
    end
  end
end

