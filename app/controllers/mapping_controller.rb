class MappingController < ApplicationController
  before_action :authenticate_user!
  def index
    # Bacolod bounding box
    min_lat = 10.6400
    max_lat = 10.7100
    min_lng = 122.9300
    max_lng = 122.9800

    # Generate 10 random markers
    @random_markers = 10.times.map do
      {
        lat: rand(min_lat..max_lat),
        lng: rand(min_lng..max_lng),
        name: "Random marker",
        address: "Bacolod City",
        url: "https://www.google.com/maps/search/?api=1&query=#{rand(min_lat..max_lat)},#{rand(min_lng..max_lng)}"
      }
    end
  end
end
