class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :lists,
             resource: EntryResource,
             foreign_key: :creator_id

  # Indirect associations

end
