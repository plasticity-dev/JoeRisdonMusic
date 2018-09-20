class InstagramController < ApplicationController

# set's collection, set's script for this specific page
# updates if need/ private method
# prints posts gathered
  def index
    @instagram_posts = Instagram.all
    @script_link = 'https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.min.js'
  end

  def update
    @albums = Album.all
    @gigs = Gig.order(date: :desc)
    render "home/index"
    update_if_change_instagram_posts
  end


  private
  # runs scraper to get all the posts it can in 1 seconds, about 40 images
  def instagram_posts
    require 'insta_scrape'
    return InstaScrape.long_scrape_user_posts(INSTAGRAM_USERNAME, 2)
  end

  #runs scraper as fast as it can to just grab that most recent post
  def get_first_post
    require 'insta_scrape'
    return InstaScrape.long_scrape_user_posts(INSTAGRAM_USERNAME, 0.01)
  end

  def update_database
    @online_posts = instagram_posts
    Instagram.delete_all
    @online_posts.each do |post|
      Instagram.create(image_url: post.image, link: post.link, text: post.text)
    end
  end

# checks if most recent post on instagram matches most recent in DB, clears DB and "re-uploads"
  def update_if_change_instagram_posts
    if get_first_post[0].link != Instagram.first.link
      update_database
    end
  end
end
