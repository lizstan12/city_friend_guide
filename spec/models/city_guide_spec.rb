require "rails_helper"

RSpec.describe CityGuide, type: :model do
  describe "Direct Associations" do
    it { should have_many(:entries) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
