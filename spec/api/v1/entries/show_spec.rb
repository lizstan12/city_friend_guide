require 'rails_helper'

RSpec.describe "entries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/entries/#{entry.id}", params: params
  end

  describe 'basic fetch' do
    let!(:entry) { create(:entry) }

    it 'works' do
      expect(EntryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('entries')
      expect(d.id).to eq(entry.id)
    end
  end
end
