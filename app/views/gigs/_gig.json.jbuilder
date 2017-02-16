json.extract! gig, :id, :band_name, :venue, :street, :city, :state, :description, :date, :url, :created_at, :updated_at
json.url gig_url(gig, format: :json)