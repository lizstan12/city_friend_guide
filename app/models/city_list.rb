class CityList < ApplicationRecord
  # Direct associations

  has_many   :entries,
             foreign_key: "citylist_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
