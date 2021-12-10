class AddGeoLocationLongitudeToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :geo_location_longitude, :float
  end
end
