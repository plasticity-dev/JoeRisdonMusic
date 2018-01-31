class InstagramController < ApplicationController
  helper_method :instagram_posts

  def index
    @instagram_posts = Instagram.all
    @script_link = 'https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.min.js'
    update_if_change_instagram_posts
    p "Gathered #{Instagram.count} posts!"
  end


  private

  def instagram_posts
    require 'insta_scrape'
    return InstaScrape.long_scrape_user_posts(INSTAGRAM_USERNAME, 1)
  end

  def get_first_post
    require 'insta_scrape'
    return InstaScrape.long_scrape_user_posts(INSTAGRAM_USERNAME, 0.01)
  end

  def update_if_change_instagram_posts
    if get_first_post[0].link != Instagram.first.link
      @online_posts = instagram_posts
      Instagram.delete_all
      @online_posts.each do |post|
        Instagram.create(image_url: post.image, link: post.link, text: post.text)
      end
    end
  end

end
