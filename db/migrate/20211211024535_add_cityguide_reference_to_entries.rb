class AddCityguideReferenceToEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :entries, :city_lists, column: :citylist_id
    add_index :entries, :citylist_id
    change_column_null :entries, :citylist_id, false
  end
end
