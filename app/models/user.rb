class User < ApplicationRecord
  # Direct associations

  has_many   :lists,
             :class_name => "Entry",
             :foreign_key => "creator_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
