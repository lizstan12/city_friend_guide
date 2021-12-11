require "rails_helper"

RSpec.describe "city_lists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/city_lists", params: params
  end

  describe "basic fetch" do
    let!(:city_list1) { create(:city_list) }
    let!(:city_list2) { create(:city_list) }

    it "works" do
      expect(CityListResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["city_lists"])
      expect(d.map(&:id)).to match_array([city_list1.id, city_list2.id])
    end
  end
end
