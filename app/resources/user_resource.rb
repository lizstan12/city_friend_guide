class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :follower_requests,
             resource: FollowerResource,
             foreign_key: :receiver_id

  has_many   :followers,
             foreign_key: :sender_id

  has_many   :city_lists,
             resource: EntryResource,
             foreign_key: :creator_id

  # Indirect associations
end
