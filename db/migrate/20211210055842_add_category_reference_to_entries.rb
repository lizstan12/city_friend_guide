class AddCategoryReferenceToEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :entries, :categories
    add_index :entries, :category_id
    change_column_null :entries, :category_id, false
  end
end
