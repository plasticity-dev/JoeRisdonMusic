module GigsHelper

  def extlink(link)
    if link.include?("http://") || link.include?("https://")
      return link
    else
      link.insert(0, "http://")
      return link
    end
  end

end
