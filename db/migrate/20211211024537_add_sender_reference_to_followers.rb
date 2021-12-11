class AddSenderReferenceToFollowers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :followers, :users, column: :sender_id
    add_index :followers, :sender_id
    change_column_null :followers, :sender_id, false
  end
end
