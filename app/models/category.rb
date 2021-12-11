class Category < ApplicationRecord
  # Direct associations

  has_many   :entries,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    art_design
  end
end
