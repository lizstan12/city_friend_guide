class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :art_design, :string
  attribute :food, :string
  attribute :historical, :string

  # Direct associations

  # Indirect associations

end
