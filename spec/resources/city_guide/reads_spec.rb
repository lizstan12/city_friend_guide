require "rails_helper"

RSpec.describe CityGuideResource, type: :resource do
  describe "serialization" do
    let!(:city_guide) { create(:city_guide) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(city_guide.id)
      expect(data.jsonapi_type).to eq("city_guides")
    end
  end

  describe "filtering" do
    let!(:city_guide1) { create(:city_guide) }
    let!(:city_guide2) { create(:city_guide) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: city_guide2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([city_guide2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:city_guide1) { create(:city_guide) }
      let!(:city_guide2) { create(:city_guide) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      city_guide1.id,
                                      city_guide2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      city_guide2.id,
                                      city_guide1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
