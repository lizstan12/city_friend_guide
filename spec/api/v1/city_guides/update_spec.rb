require "rails_helper"

RSpec.describe "city_guides#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/city_guides/#{city_guide.id}", payload
  end

  describe "basic update" do
    let!(:city_guide) { create(:city_guide) }

    let(:payload) do
      {
        data: {
          id: city_guide.id.to_s,
          type: "city_guides",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CityGuideResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { city_guide.reload.attributes }
    end
  end
end
