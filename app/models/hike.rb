
class Hike < ApplicationRecord
  has_many :events

  def self.create_from_strava(strava_id)
    # hike_strava = Strava::api() URL AVEC L'ID DE STRAVA ROUTE
    new_hike = create(
      elevation:
      # REPRENDRE LES DONNEES DE LA HIKE
    )
    return new_hike
  end


end
