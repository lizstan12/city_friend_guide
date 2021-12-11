require "rails_helper"

RSpec.describe "city_lists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/city_lists/#{city_list.id}"
  end

  describe "basic destroy" do
    let!(:city_list) { create(:city_list) }

    it "updates the resource" do
      expect(CityListResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CityList.count }.by(-1)
      expect { city_list.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
