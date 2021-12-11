require "rails_helper"

RSpec.describe "followers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/followers", params: params
  end

  describe "basic fetch" do
    let!(:follower1) { create(:follower) }
    let!(:follower2) { create(:follower) }

    it "works" do
      expect(FollowerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["followers"])
      expect(d.map(&:id)).to match_array([follower1.id, follower2.id])
    end
  end
end
