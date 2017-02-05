class Album < ApplicationRecord

  def year
    self.release_date.year
  end
end
