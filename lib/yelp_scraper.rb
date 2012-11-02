module YelpScraper
  def self.get_page_content(url, parse_for_objects=false)
    puts "Fetching data from page #{url}"
    cookie_file = File.join(Rails.root, "config", "cookie.dat")
    cookies = WebAgent::CookieManager.new cookie_file

    clnt = HTTPClient.new()
    clnt.cookie_manager = cookies
    clnt.debug_dev = STDOUT if $DEBUG

    content = clnt.get_content(url)
    parse_links_for_objects(content) if parse_for_objects

    content
  end

  def self.parse_links_for_objects(html)

    parsed = Nokogiri::HTML(html)
    puts "Analyzing page for links"

    user_ids = []
    biz_links = []
    review_ids = []

    links = parsed.css('a')

    ap links.map { |link| link['href'] }.uniq

    links.select do |link|
      href = link["href"]
      params = extract_params(href)

      if params.key? "userid"
        user_ids << params["userid"].first
      end

      biz_link = href.match(/\/biz\/(.*)/)
      unless biz_link.nil?
        clean_biz_link = biz_link[1].gsub(/#hrid:.*/, '')
        clean_biz_link = clean_biz_link.gsub(/\?.*/, '')
        biz_links << clean_biz_link
      end

      review_link = href.match(/#hrid:(.*)/)
      unless review_link.nil?
        review_ids << review_link[1]
      end
    end


    puts "* " * 40
    puts "Following these links found on the page!"
    puts "* " * 40

    user_ids = user_ids.uniq
    user_ids.each do |user_id|
      puts "Enqueue: User #{user_id}"
      Resque.enqueue(User, user_id, true)
    end

    puts "Biz"
    biz_links = biz_links.uniq
    biz_links.each do |biz_id|
      puts "Enqueue: Biz #{biz_id}"
      Resque.enqueue(Restaurant, biz_id, true)
    end

    puts "Reviews"
    ap review_ids.uniq
  end

  def self.extract_params uri
    query_string = URI.parse(uri).query
    unless query_string.nil?
      CGI::parse(query_string)
    else
      {}
    end

  end
end
