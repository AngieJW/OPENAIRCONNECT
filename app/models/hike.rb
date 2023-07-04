require "json"
require "open-uri"

class Hike < ApplicationRecord
  has_many :events

  def self.create_from_strava(strava_id)
    url = "https://www.strava.com/api/v3/routes/#{strava_id.to_i}?access_token=94ae00bb8f3b1f1fd03c76deffc517849eced90a"

    route_serialized = URI.open(url).read
    route = JSON.parse(route_serialized)
    distance = route["distance"] / 10000
    elevation = route["elevation_gain"].truncate
    duration = route["estimated_moving_time"]
    route_url = route["map_urls"]["url"]
    title = route["name"]
    # REPRENDRE LES DONNEES DE LA HIKE
    new_hike = create( elevation: elevation,distance: distance, duration: duration, image_url: route_url, title: title)
    return new_hike
  end


end
