class AddReceiverReferenceToFollowers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :followers, :users, column: :receiver_id
    add_index :followers, :receiver_id
    change_column_null :followers, :receiver_id, false
  end
end
