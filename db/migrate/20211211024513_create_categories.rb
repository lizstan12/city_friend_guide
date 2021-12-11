class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :art_design
      t.string :food
      t.string :historical

      t.timestamps
    end
  end
end
