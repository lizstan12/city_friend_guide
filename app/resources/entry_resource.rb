class EntryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :creator_id, :integer
  attribute :neighborhood, :string
  attribute :cityguide_id, :integer
  attribute :geo_location, :string
  attribute :category_id, :integer
  attribute :journal, :string

  # Direct associations

  # Indirect associations

end
