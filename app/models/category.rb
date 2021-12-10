class Category < ApplicationRecord
  # Direct associations

  has_many   :lists,
             class_name: "Entry",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    art_design
  end
end
