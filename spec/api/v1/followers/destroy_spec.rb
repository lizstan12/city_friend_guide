require "rails_helper"

RSpec.describe "followers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/followers/#{follower.id}"
  end

  describe "basic destroy" do
    let!(:follower) { create(:follower) }

    it "updates the resource" do
      expect(FollowerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Follower.count }.by(-1)
      expect { follower.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
