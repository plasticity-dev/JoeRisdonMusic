class Album < ApplicationRecord

  def year
    self.release_date.year
  end

  def self.orderedCollection
    collection = {}
      Album.all.reverse.each { |album|
        if !collection[album.artist]
          collection[album.artist] = [album]
        else
          collection[album.artist].push(album)
        end
      }
      return collection
  end

end
