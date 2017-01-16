require 'Nokogiri'
require 'open-uri'
require 'active_support/core_ext/hash/conversions'
require 'json'

@doc = Nokogiri::HTML(open('https://thebuffaloryders.bandcamp.com/music'))
@data =  @doc.css(".music-grid").attr('data-initial-values').value

@albums = JSON.parse(@data.gsub("'",'"').gsub('=>',':'))
@album_art = @doc.css("ol").first.css("img").map {|img| img.attr('src') }

counter = 0
@albums.each do |album|
  album.merge!('album_art' => @album_art[counter])
  counter+=1
end

p @albums
