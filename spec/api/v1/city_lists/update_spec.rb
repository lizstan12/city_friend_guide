require "rails_helper"

RSpec.describe "city_lists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/city_lists/#{city_list.id}", payload
  end

  describe "basic update" do
    let!(:city_list) { create(:city_list) }

    let(:payload) do
      {
        data: {
          id: city_list.id.to_s,
          type: "city_lists",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CityListResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { city_list.reload.attributes }
    end
  end
end
