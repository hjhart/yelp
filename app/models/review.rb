class Review < ActiveRecord::Base
  attr_accessible :content, :cool_count, :funny_count, :hrid, :rating, :title, :useful_count, :user_id, :restaurant_id
  belongs_to :user
  belongs_to :restaurant

  def parse_html_to_database(node)
    attributes = {}

    attributes["content"] = node.css("p.review_comment").text.strip
    attributes["rating"] = node.css('.rating-meta meta[itemprop=ratingValue]').first["content"]
    attributes["cool_count"] = node.css('li.cool a + span').text.gsub(/[\(\)]/, '')
    attributes["funny_count"] = node.css('li.funny a + span').text.gsub(/[\(\)]/, '')
    attributes["useful_count"] = node.css('li.useful a + span').text.gsub(/[\(\)]/, '')
    attributes["hrid"] = node.css('div.rateReview').first['id'].gsub('ufc_', '')
    attributes["user_id"] = node.css('li.user-name a').first["href"].gsub(/.*\?userid=/, '')

    update_attributes!(attributes)
  end
end
