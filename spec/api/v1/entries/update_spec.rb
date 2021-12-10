require "rails_helper"

RSpec.describe "entries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/entries/#{entry.id}", payload
  end

  describe "basic update" do
    let!(:entry) { create(:entry) }

    let(:payload) do
      {
        data: {
          id: entry.id.to_s,
          type: "entries",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(EntryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { entry.reload.attributes }
    end
  end
end
