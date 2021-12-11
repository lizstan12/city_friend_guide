require "rails_helper"

RSpec.describe CityListResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "city_lists",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CityListResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CityList.count }.by(1)
    end
  end

  describe "updating" do
    let!(:city_list) { create(:city_list) }

    let(:payload) do
      {
        data: {
          id: city_list.id.to_s,
          type: "city_lists",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CityListResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { city_list.reload.updated_at }
      # .and change { city_list.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:city_list) { create(:city_list) }

    let(:instance) do
      CityListResource.find(id: city_list.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CityList.count }.by(-1)
    end
  end
end
