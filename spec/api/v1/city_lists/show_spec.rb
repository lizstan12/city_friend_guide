require "rails_helper"

RSpec.describe "city_lists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/city_lists/#{city_list.id}", params: params
  end

  describe "basic fetch" do
    let!(:city_list) { create(:city_list) }

    it "works" do
      expect(CityListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("city_lists")
      expect(d.id).to eq(city_list.id)
    end
  end
end
