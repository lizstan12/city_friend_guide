class CreateCityGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :city_guides do |t|
      t.integer :entry_id

      t.timestamps
    end
  end
end
