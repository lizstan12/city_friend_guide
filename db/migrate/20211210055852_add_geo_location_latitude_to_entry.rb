class AddGeoLocationLatitudeToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :geo_location_latitude, :float
  end
end
