class EntryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :creator_id, :integer
  attribute :neighborhood, :string
  attribute :citylist_id, :integer
  attribute :geo_location, :string
  attribute :category_id, :integer
  attribute :journal, :string
  attribute :status, :string_enum, allow: Entry.statuses.keys

  # Direct associations

  belongs_to :cityguide,
             resource: CityListResource,
             foreign_key: :citylist_id

  belongs_to :category

  belongs_to :creator,
             resource: UserResource

  # Indirect associations
end
