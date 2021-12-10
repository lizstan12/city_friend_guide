require "rails_helper"

RSpec.describe "city_guides#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/city_guides/#{city_guide.id}", params: params
  end

  describe "basic fetch" do
    let!(:city_guide) { create(:city_guide) }

    it "works" do
      expect(CityGuideResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("city_guides")
      expect(d.id).to eq(city_guide.id)
    end
  end
end
