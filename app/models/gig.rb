class Gig < ApplicationRecord
 validates :date, presence: true
 
  def map_venue
    self.venue.gsub('&', 'and')
  end

  def self.future_dates
    future_gigs = []
    Gig.all.each do |gig|
      if gig.date.future?
        future_gigs.push(gig)
      end
    end
    return future_gigs.reverse()
  end

  def self.past_dates
    past_gigs = []
    Gig.all.each do |gig|
      if gig.date.past?
        past_gigs.push(gig)
      end
    end
    return past_gigs
  end

end
