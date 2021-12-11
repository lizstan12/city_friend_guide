require "rails_helper"

RSpec.describe "followers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/followers/#{follower.id}", params: params
  end

  describe "basic fetch" do
    let!(:follower) { create(:follower) }

    it "works" do
      expect(FollowerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("followers")
      expect(d.id).to eq(follower.id)
    end
  end
end
