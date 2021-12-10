require "rails_helper"

RSpec.describe CityGuideResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "city_guides",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CityGuideResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CityGuide.count }.by(1)
    end
  end

  describe "updating" do
    let!(:city_guide) { create(:city_guide) }

    let(:payload) do
      {
        data: {
          id: city_guide.id.to_s,
          type: "city_guides",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CityGuideResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { city_guide.reload.updated_at }
      # .and change { city_guide.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:city_guide) { create(:city_guide) }

    let(:instance) do
      CityGuideResource.find(id: city_guide.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CityGuide.count }.by(-1)
    end
  end
end
