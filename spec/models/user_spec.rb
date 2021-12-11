require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:follower_requests) }

    it { should have_many(:followers) }

    it { should have_many(:city_lists) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
