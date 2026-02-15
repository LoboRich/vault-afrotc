class MappingController < ApplicationController
  before_action :authenticate_user!
  def index
    @random_markers = Reservist.where.not(lat: nil, long: nil, city: nil).map do |reservist|{
        lat: reservist.lat.to_f,
        lng: reservist.long.to_f,
        name: reservist.full_name,
        city: reservist.city,
        address: reservist.location,
        url: "https://www.google.com/maps/search/?api=1&query=#{reservist.latitude},#{reservist.longitude}"
      }
    end
  end
end
