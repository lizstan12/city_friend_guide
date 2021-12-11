class AddCreatorReferenceToEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :entries, :users, column: :creator_id
    add_index :entries, :creator_id
    change_column_null :entries, :creator_id, false
  end
end
