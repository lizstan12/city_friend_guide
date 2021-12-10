require 'rails_helper'

RSpec.describe "city_guides#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/city_guides", params: params
  end

  describe 'basic fetch' do
    let!(:city_guide1) { create(:city_guide) }
    let!(:city_guide2) { create(:city_guide) }

    it 'works' do
      expect(CityGuideResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['city_guides'])
      expect(d.map(&:id)).to match_array([city_guide1.id, city_guide2.id])
    end
  end
end
