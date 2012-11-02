class User < ActiveRecord::Base
  attr_accessible :cool_votes, :friends, :funny_votes, :local_photos, :public_name, :reviews, :tips, :useful_votes, :user_id, :username, :yelping_since

  @deep_traverse = false
  @queue = :users

  def profile_url
    "http://www.yelp.com/user_details_bookmarks?userid=#{user_id}"
  end

  def populate_info
    raise Exception if user_id.nil?

    content = YelpScraper.get_page_content(profile_url)
    parsed = Nokogiri::HTML(content)

    attributes = {}
    attributes[:username] = parsed.css('.about-connections p a').text.gsub(".yelp.com", "")
    attributes[:public_name] = parsed.css('.about-connections h1').text.gsub("'s Profile", "").strip

    vote_counts = parsed.css('p#review_votes').text
    useful_votes, funny_votes, cool_votes = vote_counts.match(/(\d+) Useful, (\d+) Funny, and (\d)+ Cool/i).captures

    attributes[:cool_votes] = cool_votes
    attributes[:funny_votes] = funny_votes
    attributes[:useful_votes] = useful_votes
    attributes[:friends] = parsed.css('#user_stats .i-green-friends-common-wrap').text.gsub(/[^\d]/, "")
    attributes[:reviews] = parsed.css('#user_stats .i-user-review-count-common-wrap').text.gsub(/[^\d]/, "")
    attributes[:local_photos] = parsed.css('#user_stats .i-camera-common-wrap').text.gsub(/[^\d]/, "")
    attributes[:tips] =  parsed.css('#user_stats .i-light-bulb-common-wrap').text.gsub(/[^\d]/, "")
    #attributes[:yelping_since] = parsed.css('')

    update_attributes!(attributes)

    puts "Saved user attributes for user #{user_id}"
    ap attributes
  end

  def self.perform(user_id, deep_traverse=false)
    if user_id.nil?
      puts "User ID was not specified for this queue"
      raise Exception
    end

    user = User.find_by_user_id(user_id)
    @deep_traverse = deep_traverse

    if(user)
      puts "The user with id #{user_id} already exists. Not updating information."
    else
      user = User.new(:user_id => user_id)
      user.populate_info
    end
  end
end
