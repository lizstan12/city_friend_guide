require "rails_helper"

RSpec.describe "entries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/entries/#{entry.id}"
  end

  describe "basic destroy" do
    let!(:entry) { create(:entry) }

    it "updates the resource" do
      expect(EntryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Entry.count }.by(-1)
      expect { entry.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
