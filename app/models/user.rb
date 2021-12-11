class User < ApplicationRecord
  # Direct associations

  has_many   :follower_requests,
             class_name: "Follower",
             foreign_key: "receiver_id",
             dependent: :destroy

  has_many   :followers,
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :city_lists,
             class_name: "Entry",
             foreign_key: "creator_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end
end
