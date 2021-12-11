class AddGeoLocationFormattedAddressToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :geo_location_formatted_address, :string
  end
end
