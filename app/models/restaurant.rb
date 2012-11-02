class Restaurant < ActiveRecord::Base
  attr_accessible :address, :category, :name, :phone_number, :rating, :restaurant_url, :website, :num_of_reviews
  has_many :reviews

  def target_restaurant_url(offset = nil)
    unless offset.nil?
      YELP_RESTAURANT_URL + restaurant_url
    else
      YELP_RESTAURANT_URL + restaurant_url + "?start=#{offset}"
    end
  end

  def populate_info
    raise Exception if restaurant_url.nil?
    clnt = HTTPClient.new()

    content = clnt.get_content(target_restaurant_url)
    parsed = Nokogiri::HTML(content)

    attributes = {}
    attributes[:name] = parsed.css('#bizInfoHeader h1').text.strip
    attributes[:category] = parsed.css('#cat_display').text.strip
    attributes[:address] = parsed.css('address').text.strip
    attributes[:phone_number] = parsed.css('#bizPhone').text.strip
    attributes[:rating] = parsed.css('div#bizRating meta[itemprop=ratingValue]').first['content']
    attributes[:website] = parsed.css('div#bizUrl').text.strip
    attributes[:num_of_reviews] = parsed.css('#about_reviews_tabs li[rel=reviews] a span').text.gsub(/[^\d]/, '')

    puts "The attributes for that restaurant:"
    ap attributes

    self.update_attributes!(attributes)
  end

  def populate_review_info
    if num_of_reviews.nil?
      puts "Number of reviews is not populated. Needed for offset calculation"
      populate_info
    end

    offset = 0
    while(offset <= num_of_reviews)

      raise Exception if restaurant_url.nil?
      clnt = HTTPClient.new()

      content = clnt.get_content(target_restaurant_url)
      parsed = Nokogiri::HTML(content)

      parsed.css('li.review').each do |review|
        rv = Review.new
        rv.parse_html_to_database(review)
      end

      offset += 40
    end
  end

end
