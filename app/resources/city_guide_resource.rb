class CityGuideResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :entry_id, :integer

  # Direct associations

  has_many   :entries,
             foreign_key: :cityguide_id

  # Indirect associations
end
