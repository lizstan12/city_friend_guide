require "rails_helper"

RSpec.describe "followers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/followers/#{follower.id}", payload
  end

  describe "basic update" do
    let!(:follower) { create(:follower) }

    let(:payload) do
      {
        data: {
          id: follower.id.to_s,
          type: "followers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FollowerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { follower.reload.attributes }
    end
  end
end
