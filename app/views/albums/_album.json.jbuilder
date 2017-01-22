json.extract! album, :id, :title, :track_count, :year, :artist, :bandcamp_link, :artwork_url, :description, :release_date, :created_at, :updated_at
json.url album_url(album, format: :json)