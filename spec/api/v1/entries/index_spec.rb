require 'rails_helper'

RSpec.describe "entries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/entries", params: params
  end

  describe 'basic fetch' do
    let!(:entry1) { create(:entry) }
    let!(:entry2) { create(:entry) }

    it 'works' do
      expect(EntryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['entries'])
      expect(d.map(&:id)).to match_array([entry1.id, entry2.id])
    end
  end
end
