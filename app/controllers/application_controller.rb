class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :instagramposts
  skip_before_action :verify_authenticity_token

  def instagramposts
    @images = getinsta
  end

  def index
    @albums = Album.all
    @gigs = Gig.order(:date)[0..2]
    render "home/index"
  end

  def instagram
    render "instagram/instagram_show"
  end

  def merch
    render "merch/merch"
  end

  def bookjoe
    render "booking/booking"
  end

  def mailer
    if params[:name] && params[:message] && params[:email]
      emailer = Postmark::ApiClient.new(ENV['POSTMARK'])
      emailer.deliver(
      from: 'booking@joerisdon.com',
      to: 'booking@joerisdon.com',
      subject: 'Booking from JoeRisdon.com',
      text_body: "You have a new message from #{params[:name]}:\n\n #{params[:message]} \n\n Please respond to #{params[:email]}")
      flash[:notice] = "Message successfully sent"
      redirect_to "/"
    else
      flash[:notice] = "Message did not send"
    end
    return status
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
