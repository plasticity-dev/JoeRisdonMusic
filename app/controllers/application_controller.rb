class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :instagramposts

  def instagramposts
    @images = getinsta
  end

  def index
    @albums = Album.all
    render "home/index"
  end

  def instagram
    render "instagram/instagram_show"
  end

  private

  def getalbums

  end

  def getinsta
    require 'uri'
    string = "https://www.instagram.com/joerisdonsongs/media/"
    uri = URI(string)
    response = Net::HTTP.get_response(uri)
    response_body = JSON.parse(response.body)
    return response_body['items']
  end
end
