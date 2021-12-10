class AddCityguideReferenceToEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :entries, :city_guides, column: :cityguide_id
    add_index :entries, :cityguide_id
    change_column_null :entries, :cityguide_id, false
  end
end
