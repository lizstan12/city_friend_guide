class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :creator_id
      t.string :neighborhood
      t.integer :citylist_id
      t.string :geo_location
      t.integer :category_id
      t.text :journal
      t.integer :status

      t.timestamps
    end
  end
end
