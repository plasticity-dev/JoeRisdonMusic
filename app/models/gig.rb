class Gig < ApplicationRecord

  def map_venue
    self.venue.gsub('&', 'and')
  end

end
