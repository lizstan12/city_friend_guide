require 'open-uri'
class Entry < ApplicationRecord
  before_validation :geocode_geo_location

  def geocode_geo_location
    if self.geo_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.geo_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.geo_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.geo_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.geo_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :cityguide,
             :class_name => "CityGuide"

  belongs_to :category

  belongs_to :creator,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    creator.to_s
  end

end
