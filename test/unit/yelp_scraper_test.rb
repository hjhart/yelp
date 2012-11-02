require 'test_helper'

class YelpScraperTest < ActiveSupport::TestCase
  test "zee truth" do
    html = <<EOF
  "<div class="column column-sub-alpha " id="bookmarks_main">
  				<h3 class="clearfix" style="margin-bottom:0;">Bookmarked Businesses</h3>
  <form action="/bookmark/biz_private" method="POST" name="bookmark_biz_private">
  <input type="hidden" class="csrftok" name="csrftok" value="7e2b0d26ff74b1af5de315a35f99bd769e6254e25e2820961faffebb4f60d5e6">
  						<input type="hidden" name="return_url" value="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;cc=US&amp;city=San+Francisco&amp;state=CA">
  						<span class="formLabel">Public - others can see your bookmarks (<input type="submit" value="Make Private" class="smaller strong_pseudolink">)</span>

  </form>
  				<div id="biz_bookmarks_filters" class="clearfix">
  					<div id="biz_bookmarks_label_filters">
  						<h4>Filter by Label:</h4>
  						<ul>
  									<li>
  										<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;label=To+Try">
  											To Try
  										</a> (203)
  									</li>
  									<li>
  										<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;label=">
  											No Label
  										</a> (193)
  									</li>
  									<li>
  										<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;label=To+Review">
  											To Review
  										</a> (1)
  									</li>
  						</ul>
  					</div>
  					<div id="biz_bookmarks_category_filters">
  						<h4>Filter by Category:</h4>


  							<ul>
  									<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants">Restaurants (332)</a></li>
  									<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=food">Food (94)</a></li>
  									<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=nightlife">Nightlife (66)</a></li>
  									<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=arts">Arts &amp; Entertainment (8)</a></li>
  									<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=eventservices">Event Planning &amp; Services (8)</a></li>
  							</ul>
  					</div>
  					<div id="biz_bookmarks_city_filters">
  						<h4>Filter by City: </h4>
  						<ul>
  								<li>San Francisco [<a href="/user_details_bookmarks?state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA">undo</a>]</li>
  						</ul>

  								<h5>Filter by Neighborhood: </h5>
  								<ul>
  											<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;neighborhood=Western+Addition">Western Addition (68)</a></li>
  											<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;neighborhood=Mission">Mission (57)</a></li>
  											<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;neighborhood=Financial+District">Financial District (55)</a></li>
  											<li><a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;neighborhood=Lower+Pacific+Heights">Lower Pacific Heights (33)</a></li>
  								</ul>
  						</div>

  						<script type="text/javascript">yelp.init.wrapper("yelp.init.userDetailsBookmarks.bookmarkOnLoad", {"childHoods": [{"count": 4, "neighborhood": "Alamo Square"}, {"count": 2, "neighborhood": "Bernal Heights"}, {"count": 6, "neighborhood": "Castro"}, {"count": 7, "neighborhood": "Chinatown"}, {"count": 1, "neighborhood": "Civic Center"}, {"count": 1, "neighborhood": "Cole Valley"}, {"count": 1, "neighborhood": "Crocker-Amazon"}, {"count": 6, "neighborhood": "Dogpatch"}, {"count": 16, "neighborhood": "Embarcadero"}, {"count": 1, "neighborhood": "Excelsior"}, {"count": 4, "neighborhood": "Fillmore"}, {"count": 1, "neighborhood": "Glen Park"}, {"count": 6, "neighborhood": "Haight-Ashbury"}, {"count": 11, "neighborhood": "Hayes Valley"}, {"count": 18, "neighborhood": "Inner Richmond"}, {"count": 5, "neighborhood": "Inner Sunset"}, {"count": 4, "neighborhood": "Japantown"}, {"count": 7, "neighborhood": "Laurel Heights"}, {"count": 12, "neighborhood": "Lower Haight"}, {"count": 33, "neighborhood": "Marina/Cow Hollow"}, {"count": 16, "neighborhood": "NoPa"}, {"count": 11, "neighborhood": "Nob Hill"}, {"count": 1, "neighborhood": "Noe Valley"}, {"count": 24, "neighborhood": "North Beach/Telegraph Hill"}, {"count": 2, "neighborhood": "Outer Mission"}, {"count": 2, "neighborhood": "Outer Richmond"}, {"count": 3, "neighborhood": "Outer Sunset"}, {"count": 8, "neighborhood": "Pacific Heights"}, {"count": 7, "neighborhood": "Potrero Hill"}, {"count": 2, "neighborhood": "Presidio"}, {"count": 4, "neighborhood": "Presidio Heights"}, {"count": 22, "neighborhood": "Russian Hill"}, {"count": 18, "neighborhood": "SoMa"}, {"count": 13, "neighborhood": "Tenderloin"}, {"count": 16, "neighborhood": "Union Square"}, {"count": 1, "neighborhood": "West Portal"}], "childBoroughs": [], "childCats": [{"count": 1, "alias": "active", "alias_path": "active", "id": "ug7P79Dtl1m74IUHncPnew", "title": "Active Life"}, {"count": 1, "alias": "localflavor", "alias_path": "localflavor", "id": "rM-hum4O82w7AoGu3t8RMg", "title": "Local Flavor"}, {"count": 6, "alias": "shopping", "alias_path": "shopping", "id": "7h0tX4-I8qTj1YXWpRSAYw", "title": "Shopping"}], "pageStart": 0, "childLocs": [], "businessList": [{"rating": 4.0, "phone": "(415) 967-2726", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["San Francisco, CA 94109"], "id": "wq7TIaLwZHyGkkkVqsbA1w", "city": "San Francisco", "review_count": 33, "accurate_for_map": false, "zip": "94109", "state": "CA", "latitude": 37.792978900000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["San Francisco, CA 94109"], "name": "\u00c9ireTrea", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/%C3%A9iretrea-san-francisco-2", "country": "US", "longitude": -122.4212424}, {"rating": 3.5, "phone": "(415) 495-9800", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["Yerba Buena Gardens - Upper Terrace", "720 Howard St", "San Francisco, CA 94103"], "id": "jfeOjuMf-kaQm5aaJEGWKA", "city": "San Francisco", "review_count": 529, "accurate_for_map": true, "zip": "94103", "state": "CA", "latitude": 37.784295399999998, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "Yerba Buena Gardens - Upper Terrace", "address2": "720 Howard St", "address3": "", "photos": [], "formatted_address_brief": ["720 Howard St", "San Francisco, CA 94103"], "name": "B Restaurant \u0026 Bar", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/b-restaurant-and-bar-san-francisco", "country": "US", "longitude": -122.4016872}, {"rating": 3.0, "phone": "(415) 977-0271", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["Westin Hotel", "50 3rd St", "San Francisco, CA 94105"], "id": "NoEmYFkUf6nyecFnWT3_uA", "city": "San Francisco", "review_count": 391, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.786715600000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "Westin Hotel", "address2": "50 3rd St", "address3": "", "photos": [], "formatted_address_brief": ["50 3rd St", "San Francisco, CA 94105"], "name": "Ducca", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/ducca-san-francisco", "country": "US", "longitude": -122.402817}, {"rating": 4.0, "phone": "", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["Ferry Plaza Farmers Market", "1 Ferry Bldg", "San Francisco, CA 94105"], "id": "KH6MVXnoQubNevMixBnf3g", "city": "San Francisco", "review_count": 465, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.794728473186602, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "Ferry Plaza Farmers Market", "address2": "1 Ferry Bldg", "address3": "", "photos": [], "formatted_address_brief": ["1 Ferry Bldg", "San Francisco, CA 94105"], "name": "Blue Bottle Coffee Stand", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/blue-bottle-coffee-stand-san-francisco", "country": "US", "longitude": -122.39275932312}, {"rating": 3.5, "phone": "(415) 392-4000", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1 Ferry Bldg", "Ste 17", "San Francisco, CA 94111"], "id": "hL45SVG19ZYSWWQiDjB4Vg", "city": "San Francisco", "review_count": 147, "accurate_for_map": true, "zip": "94111", "state": "CA", "latitude": 37.795550839318501, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1 Ferry Bldg", "address2": "Ste 17", "address3": "", "photos": [], "formatted_address_brief": ["1 Ferry Bldg", "San Francisco, CA 94111"], "name": "Cowgirl Creamery Sidekick", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/cowgirl-creamery-sidekick-san-francisco", "country": "US", "longitude": -122.393542528152}, {"rating": 3.5, "phone": "(415) 908-3900", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["342 Howard St", "San Francisco, CA 94105"], "id": "Tyn-UqOTpVHtZAgrB0lWyQ", "city": "San Francisco", "review_count": 1428, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.789673700000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "342 Howard St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["342 Howard St", "San Francisco, CA 94105"], "name": "Town Hall", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/town-hall-san-francisco", "country": "US", "longitude": -122.39462690000001}, {"rating": 3.5, "phone": "(415) 537-1111", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["201 Spear St", "San Francisco, CA 94105"], "id": "n8Ns2G07gUqb3nS9t0WceQ", "city": "San Francisco", "review_count": 85, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.791387999999998, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "201 Spear St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["201 Spear St", "San Francisco, CA 94105"], "name": "The Toaster Oven", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-toaster-oven-san-francisco-2", "country": "US", "longitude": -122.39214800000001}, {"rating": 4.0, "phone": "", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["150 Spear St", "San Francisco, CA 94105"], "id": "-uwnYzxqXLDJT2QOrSjYsA", "city": "San Francisco", "review_count": 169, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.791753, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "150 Spear St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["150 Spear St", "San Francisco, CA 94105"], "name": "Specialty's Cafe \u0026 Bakery", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/specialtys-cafe-and-bakery-san-francisco-4", "country": "US", "longitude": -122.393614}, {"rating": 3.5, "phone": "(415) 284-9508", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["101 Spear St", "San Francisco, CA 94105"], "id": "EfB2pkndXIUJrUvD80Wlyg", "city": "San Francisco", "review_count": 32, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.792283500000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "101 Spear St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["101 Spear St", "San Francisco, CA 94105"], "name": "Rincon Grill", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/rincon-grill-san-francisco", "country": "US", "longitude": -122.3929328}, {"rating": 3.5, "phone": "(415) 896-2589", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["175 Steuart St", "San Francisco, CA 94105"], "id": "RYwFQ8TbPG1KEfDNGbWCUg", "city": "San Francisco", "review_count": 7, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.792432099999999, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "175 Steuart St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["175 Steuart St", "San Francisco, CA 94105"], "name": "Amy's Cafe", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/amys-cafe-san-francisco", "country": "US", "longitude": -122.392051}, {"rating": 4.0, "phone": "(415) 437-1985", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1195 Oak St", "San Francisco, CA 94117"], "id": "vhBRrvdxmYBmQ9DkVmxb6w", "city": "San Francisco", "review_count": 79, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.772852, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1195 Oak St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1195 Oak St", "San Francisco, CA 94117"], "name": "Oakside Cafe", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/oakside-cafe-san-francisco", "country": "US", "longitude": -122.4389642}, {"rating": 3.5, "phone": "(415) 397-3003", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["335 Powell St", "San Francisco, CA 94102"], "id": "7gjI95m0WyUOGaij-0yMTw", "city": "San Francisco", "review_count": 246, "accurate_for_map": true, "zip": "94102", "state": "CA", "latitude": 37.787735499999997, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "335 Powell St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["335 Powell St", "San Francisco, CA 94102"], "name": "Bourbon Steak", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/bourbon-steak-san-francisco", "country": "US", "longitude": -122.4085566}, {"rating": 4.0, "phone": "(415) 863-2276", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["547 Haight St", "San Francisco, CA 94117"], "id": "hRx9n9PJ7FLmoi9GwoFg3g", "city": "San Francisco", "review_count": 1243, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.772019, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "547 Haight St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["547 Haight St", "San Francisco, CA 94117"], "name": "Toronado", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/toronado-san-francisco", "country": "US", "longitude": -122.4312455}, {"rating": 3.0, "phone": "(415) 626-8700", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["742 Valencia St", "San Francisco, CA 94110"], "id": "ufJ6pFI4nhpY0DJ5dw5I7Q", "city": "San Francisco", "review_count": 100, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.760928800000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "742 Valencia St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["742 Valencia St", "San Francisco, CA 94110"], "name": "The Abbot's Cellar", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-abbots-cellar-san-francisco", "country": "US", "longitude": -122.42152179999999}, {"rating": 4.0, "phone": "(415) 865-9523", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["3141 16th St", "San Francisco, CA 94103"], "id": "g2ktKLz4rNTi8T5WUEUYuw", "city": "San Francisco", "review_count": 1388, "accurate_for_map": true, "zip": "94103", "state": "CA", "latitude": 37.764701604324898, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "3141 16th St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["3141 16th St", "San Francisco, CA 94103"], "name": "The Monk's Kettle", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-monks-kettle-san-francisco", "country": "US", "longitude": -122.422985136509}, {"rating": 3.5, "phone": "(415) 984-1973", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["The Embarcadero", "Pier 3, Ste 108", "San Francisco, CA 94111"], "id": "9JcfPOfbBfv8p0ox-6xSgA", "city": "San Francisco", "review_count": 703, "accurate_for_map": true, "zip": "94111", "state": "CA", "latitude": 37.797945822556201, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "The Embarcadero", "address2": "Pier 3, Ste 108", "address3": "", "photos": [], "formatted_address_brief": ["The Embarcadero", "San Francisco, CA 94111"], "name": "The Plant Cafe Organic", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-plant-cafe-organic-san-francisco-4", "country": "US", "longitude": -122.396012842655}, {"rating": 4.0, "phone": "(415) 437-0303", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["306 Broderick St", "San Francisco, CA 94117"], "id": "055dTcfz2AOAFPed_2KjEQ", "city": "San Francisco", "review_count": 925, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.773455203875798, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "306 Broderick St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["306 Broderick St", "San Francisco, CA 94117"], "name": "Nopalito", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/nopalito-san-francisco", "country": "US", "longitude": -122.439326530041}, {"rating": 4.0, "phone": "(415) 348-1555", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["Hotel Palomar", "12 4th St", "San Francisco, CA 94103"], "id": "N-HhQOfBWJDroyhUyEuiUA", "city": "San Francisco", "review_count": 530, "accurate_for_map": true, "zip": "94103", "state": "CA", "latitude": 37.785418989415398, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "Hotel Palomar", "address2": "12 4th St", "address3": "", "photos": [], "formatted_address_brief": ["12 4th St", "San Francisco, CA 94103"], "name": "Fifth Floor", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/fifth-floor-san-francisco", "country": "US", "longitude": -122.40559101104699}, {"rating": 4.5, "phone": "(415) 346-7000", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1700 Hayes St", "San Francisco, CA 94117"], "id": "BDcJgUPXAdl_OvkYaR6W9A", "city": "San Francisco", "review_count": 20, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.774222799999997, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1700 Hayes St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1700 Hayes St", "San Francisco, CA 94117"], "name": "Home Service Market", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/home-service-market-san-francisco", "country": "US", "longitude": -122.4446215}, {"rating": 3.0, "phone": "(415) 440-7427", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["705 Divisadero St", "San Francisco, CA 94117"], "id": "8R9dVXoF1s9cFDKqt3uyXg", "city": "San Francisco", "review_count": 320, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.776217600000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "705 Divisadero St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["705 Divisadero St", "San Francisco, CA 94117"], "name": "Da' Pitt BBQ", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/da-pitt-bbq-san-francisco", "country": "US", "longitude": -122.43822}, {"rating": 4.0, "phone": "(415) 282-4663", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2301 Folsom St", "San Francisco, CA 94110"], "id": "uRxCjtTvJpcrD510tIDKcA", "city": "San Francisco", "review_count": 288, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.760350000000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2301 Folsom St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2301 Folsom St", "San Francisco, CA 94110"], "name": "Homestead", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/homestead-san-francisco", "country": "US", "longitude": -122.414689}, {"rating": 3.5, "phone": "(415) 567-7664", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1306 Fulton St", "San Francisco, CA 94117"], "id": "NBdAqG4Kdqy0BrCrWa0xUg", "city": "San Francisco", "review_count": 628, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.777048000000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1306 Fulton St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1306 Fulton St", "San Francisco, CA 94117"], "name": "Tsunami Sushi Bar", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/tsunami-sushi-bar-san-francisco-2", "country": "US", "longitude": -122.43859999999999}, {"rating": 4.0, "phone": "(415) 648-0109", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["3394 22nd St", "San Francisco, CA 94110"], "id": "IXzHTl7U6iysSumeHpYzJw", "city": "San Francisco", "review_count": 327, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.755304500000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "3394 22nd St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["3394 22nd St", "San Francisco, CA 94110"], "name": "Lone Palm", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/lone-palm-san-francisco", "country": "US", "longitude": -122.4229859}, {"rating": 4.0, "phone": "(415) 362-3332", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["300 California St", "San Francisco, CA 94104"], "id": "SOZuFpNqQTD5XprPD5XeVw", "city": "San Francisco", "review_count": 287, "accurate_for_map": true, "zip": "94104", "state": "CA", "latitude": 37.793372400000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "300 California St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["300 California St", "San Francisco, CA 94104"], "name": "Cafe Madeleine", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/cafe-madeleine-san-francisco", "country": "US", "longitude": -122.4003549}, {"rating": 4.0, "phone": "(415) 362-1713", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["43 O'Farrell St", "San Francisco, CA 94108"], "id": "-TOGNJ-MrC8KWgoZeAE0GQ", "city": "San Francisco", "review_count": 267, "accurate_for_map": true, "zip": "94108", "state": "CA", "latitude": 37.786661799999997, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "43 O'Farrell St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["43 O'Farrell St", "San Francisco, CA 94108"], "name": "Cafe Madeleine", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/cafe-madeleine-san-francisco-2", "country": "US", "longitude": -122.4055012}, {"rating": 3.0, "phone": "(415) 923-4400", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["333 O'Farrell St", "San Francisco, CA 94102"], "id": "UA_N0JzE0YpOP92E3Jel1w", "city": "San Francisco", "review_count": 400, "accurate_for_map": true, "zip": "94102", "state": "CA", "latitude": 37.786155100000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "333 O'Farrell St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["333 O'Farrell St", "San Francisco, CA 94102"], "name": "Urban Tavern", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/urban-tavern-san-francisco", "country": "US", "longitude": -122.41023490000001}, {"rating": 4.5, "phone": "(415) 931-5483", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1796 Union St", "San Francisco, CA 94123"], "id": "3hInKoS_u0FPJMIpbITsHw", "city": "San Francisco", "review_count": 88, "accurate_for_map": true, "zip": "94123", "state": "CA", "latitude": 37.798040700000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1796 Union St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1796 Union St", "San Francisco, CA 94123"], "name": "Lite Bite", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/lite-bite-san-francisco", "country": "US", "longitude": -122.4288294}, {"rating": 3.5, "phone": "(415) 693-9730", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["101 California St", "San Francisco, CA 94111"], "id": "5jAQK1TPVPl_YhoLdnW5Ew", "city": "San Francisco", "review_count": 260, "accurate_for_map": true, "zip": "94111", "state": "CA", "latitude": 37.793100669930404, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "101 California St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["101 California St", "San Francisco, CA 94111"], "name": "The Plant Cafe Organic", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-plant-cafe-organic-san-francisco-5", "country": "US", "longitude": -122.398746013641}, {"rating": 3.0, "phone": "(415) 921-1000", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2020 Fillmore St", "San Francisco, CA 94115"], "id": "R-IHnccjb6tXlNXzR-xsng", "city": "San Francisco", "review_count": 694, "accurate_for_map": true, "zip": "94115", "state": "CA", "latitude": 37.788346400000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2020 Fillmore St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2020 Fillmore St", "San Francisco, CA 94115"], "name": "Harry's Bar", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/harrys-bar-san-francisco", "country": "US", "longitude": -122.4336394}, {"rating": 4.5, "phone": "", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["736 Divisadero St", "San Francisco, CA 94117"], "id": "-NbDKVqG170J19MqSQ5q_A", "city": "San Francisco", "review_count": 13, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.776473000000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "736 Divisadero St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["736 Divisadero St", "San Francisco, CA 94117"], "name": "The Mill", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-mill-san-francisco", "country": "US", "longitude": -122.43771599999999}, {"rating": 4.5, "phone": "(415) 826-1363", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2916 24th St", "San Francisco, CA 94110"], "id": "DsbnNmsNgr8TAqfcZZGKkg", "city": "San Francisco", "review_count": 38, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.752770400000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2916 24th St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2916 24th St", "San Francisco, CA 94110"], "name": "La Espiga De Oro", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/la-espiga-de-oro-san-francisco", "country": "US", "longitude": -122.4104463}, {"rating": 3.5, "phone": "(415) 495-6500", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["155 Steuart St", "San Francisco, CA 94105"], "id": "ZfDcbuLBx8-CVtTUjFCQPA", "city": "San Francisco", "review_count": 278, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.792730800000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "155 Steuart St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["155 Steuart St", "San Francisco, CA 94105"], "name": "Perry's", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/perrys-san-francisco-6", "country": "US", "longitude": -122.3923803}, {"rating": 3.5, "phone": "(415) 278-3777", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["8 Mission St", "San Francisco, CA 94105"], "id": "m_enEcSpZDdF1RF65eCbvg", "city": "San Francisco", "review_count": 798, "accurate_for_map": true, "zip": "94105", "state": "CA", "latitude": 37.793530199999999, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "8 Mission St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["8 Mission St", "San Francisco, CA 94105"], "name": "Americano", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/americano-san-francisco", "country": "US", "longitude": -122.3930512}, {"rating": 3.5, "phone": "(415) 359-1800", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["5 Masonic Ave", "San Francisco, CA 94118"], "id": "of94HBCkp82oYkqGleIZGw", "city": "San Francisco", "review_count": 103, "accurate_for_map": true, "zip": "94118", "state": "CA", "latitude": 37.782103580397397, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "5 Masonic Ave", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["5 Masonic Ave", "San Francisco, CA 94118"], "name": "The Corner Store", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-corner-store-san-francisco", "country": "US", "longitude": -122.448034286499}, {"rating": 4.0, "phone": "(415) 252-7704", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2140 Mission St", "San Francisco, CA 94110"], "id": "wNcShx5YTSMvOxt6G0iA9w", "city": "San Francisco", "review_count": 302, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.762782000000001, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2140 Mission St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2140 Mission St", "San Francisco, CA 94110"], "name": "The Sycamore", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/the-sycamore-san-francisco", "country": "US", "longitude": -122.41962359999999}, {"rating": 4.5, "phone": "(415) 543-2355", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["521 3rd St", "Ste A", "San Francisco, CA 94107"], "id": "bUr4iq2mKKiBOu2HKynylg", "city": "San Francisco", "review_count": 802, "accurate_for_map": true, "zip": "94107", "state": "CA", "latitude": 37.780988299999997, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "521 3rd St", "address2": "Ste A", "address3": "", "photos": [], "formatted_address_brief": ["521 3rd St", "San Francisco, CA 94107"], "name": "HRD Coffee Shop", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/hrd-coffee-shop-san-francisco", "country": "US", "longitude": -122.39536270000001}, {"rating": 4.5, "phone": "(415) 441-1564", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1608 Bush St", "San Francisco, CA 94108"], "id": "boxJriAxouQhcg3CnxQuyQ", "city": "San Francisco", "review_count": 684, "accurate_for_map": true, "zip": "94108", "state": "CA", "latitude": 37.788275300000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1608 Bush St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1608 Bush St", "San Francisco, CA 94108"], "name": "Red Door Cafe", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/red-door-cafe-san-francisco-3", "country": "US", "longitude": -122.42374150000001}, {"rating": 4.5, "phone": "(415) 205-6032", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["888 Geneva Ave", "San Francisco, CA 94112"], "id": "3DDpeVUO_s4UrAtjoEb5gQ", "city": "San Francisco", "review_count": 142, "accurate_for_map": true, "zip": "94112", "state": "CA", "latitude": 37.716676800000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "888 Geneva Ave", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["888 Geneva Ave", "San Francisco, CA 94112"], "name": "Batter Up", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/batter-up-san-francisco", "country": "US", "longitude": -122.4413737}, {"rating": 4.0, "phone": "(415) 648-7600", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2534 Mission St", "San Francisco, CA 94110"], "id": "n6L5VIGunR51-D55C-eYeQ", "city": "San Francisco", "review_count": 2657, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.756453999999998, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2534 Mission St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2534 Mission St", "San Francisco, CA 94110"], "name": "Foreign Cinema", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/foreign-cinema-san-francisco", "country": "US", "longitude": -122.4190057}, {"rating": 3.5, "phone": "(415) 621-4132", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["359 Divisadero St", "San Francisco, CA 94117"], "id": "JtTLuQQVp6XPgfPiq6-PRQ", "city": "San Francisco", "review_count": 75, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.773026000000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "359 Divisadero St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["359 Divisadero St", "San Francisco, CA 94117"], "name": "Cafe Divis", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/cafe-divis-san-francisco", "country": "US", "longitude": -122.43753599999999}, {"rating": 3.5, "phone": "(415) 401-0810", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2526 Mission St", "San Francisco, CA 94110"], "id": "kGUsD_PWP3GGTGzfPb46Ng", "city": "San Francisco", "review_count": 356, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.756659999999997, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2526 Mission St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2526 Mission St", "San Francisco, CA 94110"], "name": "Laszlo", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/laszlo-san-francisco", "country": "US", "longitude": -122.418892}, {"rating": 4.0, "phone": "(415) 621-4132", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["359 Divisadero St", "San Francisco, CA 94117"], "id": "Wx3x6xOLkxWxwXXFrI01zA", "city": "San Francisco", "review_count": 60, "accurate_for_map": true, "zip": "94117", "state": "CA", "latitude": 37.773026000000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "359 Divisadero St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["359 Divisadero St", "San Francisco, CA 94117"], "name": "Vinyl Coffee \u0026 Wine Bar", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/vinyl-coffee-and-wine-bar-san-francisco", "country": "US", "longitude": -122.43753599999999}, {"rating": 4.0, "phone": "(415) 285-2380", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2323 Mission St", "San Francisco, CA 94110"], "id": "y8mGQTwmFaSu3d7dAywOHA", "city": "San Francisco", "review_count": 205, "accurate_for_map": true, "zip": "94110", "state": "CA", "latitude": 37.759808, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2323 Mission St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2323 Mission St", "San Francisco, CA 94110"], "name": "Dr Teeth \u0026 the Electric Mayhem", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/dr-teeth-and-the-electric-mayhem-san-francisco", "country": "US", "longitude": -122.41919470000001}, {"rating": 4.5, "phone": "(415) 981-0983", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["200 Jackson St", "San Francisco, CA 94111"], "id": "PsY5DMHxa5iNX_nX0T-qPA", "city": "San Francisco", "review_count": 2114, "accurate_for_map": true, "zip": "94111", "state": "CA", "latitude": 37.797136899999998, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "200 Jackson St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["200 Jackson St", "San Francisco, CA 94111"], "name": "Kokkari Estiatorio", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/kokkari-estiatorio-san-francisco", "country": "US", "longitude": -122.39964759999999}, {"rating": 3.5, "phone": "(415) 355-9085", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["199 Gough St", "San Francisco, CA 94102"], "id": "Xdx2_n3nk9Td_aSe7E5ARQ", "city": "San Francisco", "review_count": 58, "accurate_for_map": true, "zip": "94102", "state": "CA", "latitude": 37.775039200000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "199 Gough St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["199 Gough St", "San Francisco, CA 94102"], "name": "Rich Table", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/rich-table-san-francisco", "country": "US", "longitude": -122.4225903}, {"rating": 4.0, "phone": "(415) 503-1421", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2275 Market St", "San Francisco, CA 94114"], "id": "yC5ATYRQah7MjeTiRsGcvA", "city": "San Francisco", "review_count": 336, "accurate_for_map": true, "zip": "94114", "state": "CA", "latitude": 37.764269046911302, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2275 Market St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2275 Market St", "San Francisco, CA 94114"], "name": "Dinosaurs", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/dinosaurs-san-francisco", "country": "US", "longitude": -122.431629896164}, {"rating": 4.0, "phone": "(415) 441-7083", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2845 Geary Blvd", "San Francisco, CA 94118"], "id": "s4AmL4XID5jKEbxGUVNPMQ", "city": "San Francisco", "review_count": 502, "accurate_for_map": true, "zip": "94118", "state": "CA", "latitude": 37.7822216, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2845 Geary Blvd", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2845 Geary Blvd", "San Francisco, CA 94118"], "name": "Assab Eritrean Restaurant", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/assab-eritrean-restaurant-san-francisco", "country": "US", "longitude": -122.4500503}, {"rating": 4.0, "phone": "(415) 252-9289", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["525 Laguna St", "San Francisco, CA 94102"], "id": "DGyoVB9PdI9_jw0CNi_OPg", "city": "San Francisco", "review_count": 2095, "accurate_for_map": true, "zip": "94102", "state": "CA", "latitude": 37.776266800000002, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "525 Laguna St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["525 Laguna St", "San Francisco, CA 94102"], "name": "Suppenk\u00fcche", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/suppenk%C3%BCche-san-francisco-2", "country": "US", "longitude": -122.42642909999999}, {"rating": 4.0, "phone": "(415) 931-4800", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["1661 Divisadero St", "San Francisco, CA 94115"], "id": "e3d-jYxVx7YLTxQ2CEmb0g", "city": "San Francisco", "review_count": 74, "accurate_for_map": true, "zip": "94115", "state": "CA", "latitude": 37.785072499999998, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "1661 Divisadero St", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["1661 Divisadero St", "San Francisco, CA 94115"], "name": "Pete's Deli \u0026 Cafe", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/petes-deli-and-cafe-san-francisco", "country": "US", "longitude": -122.43987490000001}, {"rating": 4.0, "phone": "(415) 567-5330", "formatted_city": "San Francisco, CA", "biz_announcement": "", "formatted_city_name": "San Francisco", "formatted_address": ["2884 Geary Blvd", "San Francisco, CA 94118"], "id": "rJuREfb9mZTCNgXDsOPLtw", "city": "San Francisco", "review_count": 113, "accurate_for_map": true, "zip": "94118", "state": "CA", "latitude": 37.782334400000003, "cross_streets": "", "cross_streets_miniprefix": "", "address1": "2884 Geary Blvd", "address2": "", "address3": "", "photos": [], "formatted_address_brief": ["2884 Geary Blvd", "San Francisco, CA 94118"], "name": "Sunstream Coffee", "neighborhoods": "", "category_yelp_ids": [], "url": "/biz/sunstream-coffee-san-francisco", "country": "US", "longitude": -122.4497894}]});</script>


  						</div>
  					<div id="biz_bookmarks_sort_section" class="sort_section">

  					Sort By: 													<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;sort_by=time_created_asc" class="ig-wrap-common i-sort-descend-common-wrap ig-wrap-common-r selected"><i class="ig-common i-sort-descend-common"></i> Date Added</a>
  						 | 							<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;sort_by=name_desc">Name</a>
  						 | 							<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;sort_by=rating_desc">Rating</a>
  						 | 							<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;sort_by=review_count_desc">Number of Reviews</a>
  				</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_1">
  		<div class="book_biz_info">
  			<h3>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_4" title="4.0 star rating">
  			<img alt="4.0 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   33 Reviews</div>
  				<p>
  					Neighborhood: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Nob+Hill&amp;cc=US&amp;state=CA&amp;borough=">Nob Hill</a>				</p>
  				<p>Categories:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=food.streetvendors">Street Vendors</a>						, <a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.foodstands">Food Stands</a>				</p>

  			<address>
  				San Francisco, CA 94109<br>
  				(415) 967-2726<br>
  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=bhaUur3Gv6AWCazZupaZZw">
  				<img class="photo-img" alt="" height="20" src="http://s3-media3.ak.yelpcdn.com/photo/2KKZK-eJlo2fmkTIlAEEQg/xss.jpg" width="20">
  			</a>
  	</div>

  		</div>

  		<div class="bookmark_footer">
  			<p class="bookmark_note">
  				<strong>Note:</strong> Brittany spotted this one!
  			</p>

  			<p class="book_biz_actions">
  					Added 11/1/2012					 |  <a href="#" onclick="Yelp.editBizBookmark(this, &quot;aqjmpZFDTujJo_8LOoCB5Q&quot;, &quot;To Try&quot;, &quot;Brittany spotted this one!&quot;); return false;">Edit</a> | <a href="/bookmark/remove_biz?bookmark_id=aqjmpZFDTujJo_8LOoCB5Q&amp;return_url=%2Fuser_details_bookmarks%3Fuserid%3DfEwe5qckZE_sVZAXBffXGA%26cc%3DUS%26city%3DSan%2BFrancisco%26state%3DCA" onclick="Yelp.delete_bookmark(this, &quot;aqjmpZFDTujJo_8LOoCB5Q&quot;); return false;">Delete</a>
  			</p>

  				<p class="bookmark_label">Label: To Try</p>

  					<p class="bookmark_label hidden"></p>

  		</div>

  	</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_2">
  		<div class="book_biz_info">
  			<h3>
  				<a href="/biz/b-restaurant-and-bar-san-francisco" id="book_biz_name_2">2. B Restaurant &amp; Bar</a>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_3_half" title="3.5 star rating">
  			<img alt="3.5 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   529 Reviews</div>
  				<p>
  					Neighborhood: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Financial+District&amp;cc=US&amp;state=CA&amp;borough=">Financial District</a>				</p>
  				<p>Category:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.newamerican">American (New)</a>				</p>

  			<address>
  				Yerba Buena Gardens - Upper Terrace<br>720 Howard St<br>San Francisco, CA 94103<br>
  				(415) 495-9800<br>
  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=MZxpfo6fVI7bNG6q50XZKA">
  				<img class="photo-img" alt="" height="20" src="http://s3-media3.ak.yelpcdn.com/photo/ybJXl_1QGwmNYpMHp9tf-g/xss.jpg" width="20">
  			</a>
  	</div>

  		</div>

  		<div class="bookmark_footer">
  			<p class="bookmark_note">
  				<strong>Note:</strong> Shelly's rec for Friday post work (patio)
  			</p>

  			<p class="book_biz_actions">
  					Added 10/26/2012					 |  <a href="#" onclick="Yelp.editBizBookmark(this, &quot;IZCqWc7fRzJea_cAU5iYxQ&quot;, &quot;To Try&quot;, &quot;Shelly's rec for Friday post work (patio)&quot;); return false;">Edit</a> | <a href="/bookmark/remove_biz?bookmark_id=IZCqWc7fRzJea_cAU5iYxQ&amp;return_url=%2Fuser_details_bookmarks%3Fuserid%3DfEwe5qckZE_sVZAXBffXGA%26cc%3DUS%26city%3DSan%2BFrancisco%26state%3DCA" onclick="Yelp.delete_bookmark(this, &quot;IZCqWc7fRzJea_cAU5iYxQ&quot;); return false;">Delete</a>
  			</p>

  				<p class="bookmark_label">Label: To Try</p>

  					<p class="bookmark_label hidden"></p>

  		</div>

  	</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_3">
  		<div class="book_biz_info">
  			<h3>
  				<a href="/biz/ducca-san-francisco" id="book_biz_name_3">3. Ducca</a>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_3" title="3.0 star rating">
  			<img alt="3.0 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   391 Reviews</div>
  				<p>
  					Neighborhoods: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Financial+District&amp;cc=US&amp;state=CA&amp;borough=">Financial District</a>, <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Union+Square&amp;cc=US&amp;state=CA&amp;borough=">Union Square</a>				</p>
  				<p>Category:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.italian">Italian</a>				</p>

  			<address>
  				Westin Hotel<br>50 3rd St<br>San Francisco, CA 94105<br>
  				(415) 977-0271<br>
  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=a4Z8X3ic5P1YDtNzMlxCMg">
  				<img class="photo-img" alt="" height="20" src="http://s3-media3.ak.yelpcdn.com/photo/F8krgWYSp_PxwucBkwoL1A/xss.jpg" width="20">
  			</a>
  	</div>

  		</div>

  		<div class="bookmark_footer">
  			<p class="bookmark_note">
  				<strong>Note:</strong> Shelly's rec for outdoor patio (Friday after work)
  			</p>

  			<p class="book_biz_actions">
  					Added 10/26/2012					 |  <a href="#" onclick="Yelp.editBizBookmark(this, &quot;Flirh10-952k3Vx0UiqoTA&quot;, &quot;To Try&quot;, &quot;Shelly's rec for outdoor patio (Friday after work)&quot;); return false;">Edit</a> | <a href="/bookmark/remove_biz?bookmark_id=Flirh10-952k3Vx0UiqoTA&amp;return_url=%2Fuser_details_bookmarks%3Fuserid%3DfEwe5qckZE_sVZAXBffXGA%26cc%3DUS%26city%3DSan%2BFrancisco%26state%3DCA" onclick="Yelp.delete_bookmark(this, &quot;Flirh10-952k3Vx0UiqoTA&quot;); return false;">Delete</a>
  			</p>

  				<p class="bookmark_label">Label: To Try</p>

  					<p class="bookmark_label hidden"></p>

  		</div>

  	</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_4">
  		<div class="book_biz_info">
  			<h3>
  				<a href="/biz/blue-bottle-coffee-stand-san-francisco" id="book_biz_name_4">4. Blue Bottle Coffee Stand</a>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_4" title="4.0 star rating">
  			<img alt="4.0 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   465 Reviews</div>
  				<p>
  					Neighborhood: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Embarcadero&amp;cc=US&amp;state=CA&amp;borough=">Embarcadero</a>				</p>
  				<p>Categories:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=food.coffee">Coffee &amp; Tea</a>						, <a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=food.farmersmarket">Farmers Market</a>						, <a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.foodstands">Food Stands</a>				</p>

  			<address>
  				Ferry Plaza Farmers Market<br>1 Ferry Bldg<br>San Francisco, CA 94105<br>

  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=dEl_kFfpApgY-zXjAA9Kvg">
  				<img class="photo-img" alt="" height="20" src="http://s3-media3.ak.yelpcdn.com/photo/7_0zYgBXubCjkKXJSnXTTA/xss.jpg" width="20">
  			</a>
  	</div>

  		</div>

  		<div class="bookmark_footer">
  			<p class="bookmark_note" style="display: none;">
  				<strong>Note:</strong>
  			</p>

  			<p class="book_biz_actions">
  					Added 10/25/2012					 |  <a href="#" onclick="Yelp.editBizBookmark(this, &quot;jSAq-1hCdNPhbgtA0c_d0A&quot;, &quot;&quot;, &quot;&quot;); return false;">Edit</a> | <a href="/bookmark/remove_biz?bookmark_id=jSAq-1hCdNPhbgtA0c_d0A&amp;return_url=%2Fuser_details_bookmarks%3Fuserid%3DfEwe5qckZE_sVZAXBffXGA%26cc%3DUS%26city%3DSan%2BFrancisco%26state%3DCA" onclick="Yelp.delete_bookmark(this, &quot;jSAq-1hCdNPhbgtA0c_d0A&quot;); return false;">Delete</a>
  			</p>

  				<p class="bookmark_label">Label: No Label</p>

  					<p class="bookmark_label hidden"></p>

  		</div>

  	</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_5">
  		<div class="book_biz_info">
  			<h3>
  				<a href="/biz/cowgirl-creamery-sidekick-san-francisco" id="book_biz_name_5">5. Cowgirl Creamery Sidekick</a>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_3_half" title="3.5 star rating">
  			<img alt="3.5 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   147 Reviews</div>
  				<p>
  					Neighborhood: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Embarcadero&amp;cc=US&amp;state=CA&amp;borough=">Embarcadero</a>				</p>
  				<p>Categories:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.newamerican">American (New)</a>						, <a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=food.gourmet.cheese">Cheese Shops</a>						, <a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.sandwiches">Sandwiches</a>				</p>

  			<address>
  				1 Ferry Bldg<br>Ste 17<br>San Francisco, CA 94111<br>
  				(415) 392-4000<br>
  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=JG2-Z87cVoVQRiCaTtc7jw">
  				<img class="photo-img" alt="" height="20" src="http://s3-media3.ak.yelpcdn.com/photo/iDThSJKCEQ9PJmc1Q9sN6A/xss.jpg" width="20">
  			</a>
  	</div>

  		</div>

  		<div class="bookmark_footer">
  			<p class="bookmark_note" style="display: none;">
  				<strong>Note:</strong>
  			</p>

  			<p class="book_biz_actions">
  					Added 10/25/2012					 |  <a href="#" onclick="Yelp.editBizBookmark(this, &quot;jOmxKuPSDG75-piXg7TfhQ&quot;, &quot;&quot;, &quot;&quot;); return false;">Edit</a> | <a href="/bookmark/remove_biz?bookmark_id=jOmxKuPSDG75-piXg7TfhQ&amp;return_url=%2Fuser_details_bookmarks%3Fuserid%3DfEwe5qckZE_sVZAXBffXGA%26cc%3DUS%26city%3DSan%2BFrancisco%26state%3DCA" onclick="Yelp.delete_bookmark(this, &quot;jOmxKuPSDG75-piXg7TfhQ&quot;); return false;">Delete</a>
  			</p>

  				<p class="bookmark_label">Label: No Label</p>

  					<p class="bookmark_label hidden"></p>

  		</div>

  	</div>

  						<div class="bookmark_row clearfix highlight_marker_box" id="book_biz_row_6">
  		<div class="book_biz_info">
  			<h3>
  				<a href="/biz/town-hall-san-francisco" id="book_biz_name_6">6. Town Hall</a>
  			</h3>
  				<div class="biz_rating">
  		<div class="rating">
  		<i class="star-img stars_3_half" title="3.5 star rating">
  			<img alt="3.5 star rating" class="offscreen" height="20" src="http://s3-media3.ak.yelpcdn.com/assets/2/www/img/9490cf38f4e4/ico/stars/stars_map_h.png" width="1400">
  		</i>
  	</div>
   1428 Reviews</div>
  				<p>
  					Neighborhood: <a href="/user_details_bookmarks?userid=fEwe5qckZE_sVZAXBffXGA&amp;city=San+Francisco&amp;neighborhood=Financial+District&amp;cc=US&amp;state=CA&amp;borough=">Financial District</a>				</p>
  				<p>Category:						<a href="/user_details_bookmarks?cc=US&amp;city=San+Francisco&amp;state=CA&amp;userid=fEwe5qckZE_sVZAXBffXGA&amp;category=restaurants.newamerican">American (New)</a>				</p>

  			<address>
  				342 Howard St<br>San Francisco, CA 94105<br>
  				(415) 908-3900<br>
  			</address>
  		</div>

  		<div class="book_biz_review">




  	<div class="photo-box pb-xss">
  			<a href="http://www.yelp.com/user_details?userid=pDfL8xt8F8ls0-kQIG_ADg">
  				<img class="photo-img" alt="" height="20" src="http://s3-media2.ak.yelpcdn.com/photo/N2OjD5Ox7sHftZNcmECDEA/xss.jpg" width="20">
  			</a>
  	</div>


  </div>"
EOF
    YelpScraper.parse_links_for_objects(html)
  end
  test "zee most truth" do
    YelpScraper.get_page_content("http://www.yelp.com/denver", true)
  end
end
