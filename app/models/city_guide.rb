class CityGuide < ApplicationRecord
  # Direct associations

  has_many   :entries,
             foreign_key: "cityguide_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    entry_id
  end
end
