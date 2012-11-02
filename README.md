# The point

To get as much Yelp data as possible. I'm storing mine in a sqlite database for now. I'm scraping a page for restaurants and users, and then evaluating the links to scrape for more restaurants and users, probably ad infinitum (because the logic is crap right now).

# Usage

## App setup

    hub clone hjhart/yelp
    bundle
    rake db:migrate

Boot up redis, or install it if you don't have it (resque is a prerequisite for resque)

## Resque stuff

Start a worker (or five)

    QUEUE=* rake environment resque:work

Boot up resque-web for fun

    resque-web

Then start the process for ONE business on yelp, and watch it mushroom like crazy. I used:

    rails c
    Resque.enqueue(Restaurant, "state-bird-provisions-san-francisco", true)

Note: biz-id was taken from url: aka http://www.yelp.com/biz/fruition-restaurant-denver would become "fruition-restaurant-denver"


Perhaps a more serious note: It's been running for about 20 minutes and I now have 2000+ users to scrape and 267 restaurants to scrape; this number will only continue to increase.

# Tests

The tests are failing. Deal with it.

# Results

Are ridiculous:

[Imgur](http://i.imgur.com/hfyIX)