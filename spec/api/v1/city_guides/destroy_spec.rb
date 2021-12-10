require "rails_helper"

RSpec.describe "city_guides#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/city_guides/#{city_guide.id}"
  end

  describe "basic destroy" do
    let!(:city_guide) { create(:city_guide) }

    it "updates the resource" do
      expect(CityGuideResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CityGuide.count }.by(-1)
      expect { city_guide.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
