require "rails_helper"

RSpec.describe "city_guides#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/city_guides", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "city_guides",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(CityGuideResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { CityGuide.count }.by(1)
    end
  end
end
