require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "tha troof" do
    str = <<EOS
  <li id="review_iBDZNxqcat9nDaJMAhXxQw" class="review clearfix  externalReview" itemprop="review" itemscope itemtype="http://schema.org/Review">

  		<h4 class="offscreen">Review from <span itemprop="author">Michelle F.</span>
  </h4>

  <div class="clearfix media-block media-block-no-margin">
  <div class="media-avatar reviewer-details">
  					<div class="user-passport">




  	<div class="photo-box pb-ss">
  			<a href="http://www.yelp.com/user_details?userid=RDByRFSQbiVaaUXTq3A_WQ">
  				<img class="photo-img" alt="Photo of Michelle F." height="40" src="http://s3-media2.ak.yelpcdn.com/photo/x0D0POFCc9nPmkVSveKQLA/ss.jpg" width="40"></a>
  	</div>

  		<ul class="user-stats">
  <li class="friend-count miniOrange"><span class="ig-wrap-common i-orange-friends-common-wrap"><i class="ig-common i-orange-friends-common"></i> 6 <span class="offscreen">friends</span></span></li>
  		<li class="review-count miniOrange"><span class="ig-wrap-common i-user-review-count-common-wrap"><i class="ig-common i-user-review-count-common"></i> 13 <span class="offscreen">reviews</span></span></li>
  	</ul>
  <ul class="user-passport-info ieSucks">
  <li class="user-name">
  						<a href="http://www.yelp.com/user_details?userid=RDByRFSQbiVaaUXTq3A_WQ">Michelle F.</a>
  				</li>
  		</ul>
  </div>

  					<p class="reviewer_info">Denver, CO</p>

  </div>
  <div class="media-story">
  					<div class="rating-meta clearfix">
  						<div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">

  		<div class="rating">
  		<i class="star-img stars_5" title="5.0 star rating">
  			<img alt="5.0 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400"></i>
  		<meta itemprop="ratingValue" content="5.0">
  </div>

  						</div>
  						<meta itemprop="datePublished" content="2012-10-31">
  <span class="date smaller">10/31/2012</span>



  							<span title="This Yelper made a reservation for this business on Yelp." class="i-wrap i-opentable-badge-wrap badge opentable-badge-marker"><i class="i i-opentable-badge"></i> Seated via OpenTable</span>





  					</div>

  						<p class="review_comment ieSucks" itemprop="description">Fruition is everything people rave it is--small, romantic, impeccable food &amp; service. We went for my mother's bday, and totally wowed her. I had the monkfish with a lobster sauce, and my husband had the steak with carmelized polenta (that was insanely good). The wine was perfect, and so was the dessert. <br><br>It's still true that reservations are a must.</p>
  					<div class="extra-actions clearfix">


  								<div class="rateReview clearfix" id="ufc_iBDZNxqcat9nDaJMAhXxQw">
  				<p class="review-intro review-message">Was this review ?</p>
  				<ul>
  <li class="useful ufc-btn">
  						<a href="#" rel="useful"><span>Useful</span></a>

              <span></span>
  					</li>
  					<li class="funny ufc-btn">
  						<a href="#" rel="funny"><span>Funny</span></a>
              <span></span>
  					</li>
  					<li class="cool ufc-btn">
  						<a href="#" rel="cool"><span>Cool</span></a>
              <span>(1)</span>
  					</li>
  				</ul>
  </div>



  							<ul class="externalReviewActions">
  <li class="add-review-comment">
  							<a href="https://biz.yelp.com/login/add_owner_comment?biz_id=A9S4iGkRVNLWY8BSkRpDEA&amp;return_url=%2Fr2r%2FA9S4iGkRVNLWY8BSkRpDEA%2Fcomment%2FRDByRFSQbiVaaUXTq3A_WQ%2Fcompose" class="ig-wrap-common i-bizowner-comment-common-wrap add-owner-comment"><i class="ig-common i-bizowner-comment-common"></i> Add owner comment</a>

  			</li>
  		<li>
  				<a href="/signup" rel="fruition-restaurant-denver" title="Something catch your eye?&lt;br&gt;Bookmark this business to build your own list of fun ideas to check out later!" class="ig-wrap-common i-orange-bookmark-common-wrap bookmark"><i class="ig-common i-orange-bookmark-common"></i> Bookmark</a>

  		</li>
  		<li>
  					<a href="/biz_share?bizid=A9S4iGkRVNLWY8BSkRpDEA&amp;return_url=%2Fbiz%2Ffruition-restaurant-denver&amp;reviewid=iBDZNxqcat9nDaJMAhXxQw" onclick='yelp.ui.widget.SendToFriends.open(this, "A9S4iGkRVNLWY8BSkRpDEA", "iBDZNxqcat9nDaJMAhXxQw", null); return false;' class="ig-wrap-common i-orange-envelope-common-wrap sendToFriend"><i class="ig-common i-orange-envelope-common"></i> Send to a Friend</a>

  		</li>
  		<li>
  			<a href="/biz/fruition-restaurant-denver#hrid:iBDZNxqcat9nDaJMAhXxQw" class="ig-wrap-common i-orange-link-common-wrap"><i class="ig-common i-orange-link-common"></i> Link to This Review</a>
  		</li>
  	</ul>
  </div>



  </div>
  </div>
  	</li>
EOS
    parsed = Nokogiri::HTML(str)
    review = Review.new
    review.parse_html_to_database(parsed)

  end


end
