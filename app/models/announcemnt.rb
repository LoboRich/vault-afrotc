class Announcemnt < ApplicationRecord
  def google_maps_link
    "https://www.google.com/maps?q=#{latitude},#{longitude}"
  end
end
