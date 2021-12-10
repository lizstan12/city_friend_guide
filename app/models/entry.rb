class Entry < ApplicationRecord
  # Direct associations

  belongs_to :cityguide,
             :class_name => "CityGuide"

  belongs_to :category

  belongs_to :creator,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    creator.to_s
  end

end
