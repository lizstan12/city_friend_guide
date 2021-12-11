class Follower < ApplicationRecord
  # Direct associations

  belongs_to :receiver,
             class_name: "User"

  belongs_to :sender,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end
end
