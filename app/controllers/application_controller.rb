class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :instagram_posts
  skip_before_action :verify_authenticity_token

  def index
    @albums = Album.all
    @gigs = Gig.order(date: :desc)
    render "home/index"
  end

  def instagram
    @script_link = 'https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.min.js'
    render "instagram/instagram_show"
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

  def instagram_posts
    require 'insta_scrape'
    return InstaScrape.long_scrape_user_posts(INTAGRAM_USERNAME, 0.7)
  end

end
