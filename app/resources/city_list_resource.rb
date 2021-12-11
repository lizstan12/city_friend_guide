class CityListResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :city_id, :integer
  attribute :user_id, :integer

  # Direct associations

  has_many   :entries,
             foreign_key: :citylist_id

  # Indirect associations
end
