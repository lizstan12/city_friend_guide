class CreateCityLists < ActiveRecord::Migration[6.0]
  def change
    create_table :city_lists do |t|
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
