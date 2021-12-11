require "rails_helper"

RSpec.describe CityListResource, type: :resource do
  describe "serialization" do
    let!(:city_list) { create(:city_list) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(city_list.id)
      expect(data.jsonapi_type).to eq("city_lists")
    end
  end

  describe "filtering" do
    let!(:city_list1) { create(:city_list) }
    let!(:city_list2) { create(:city_list) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: city_list2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([city_list2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:city_list1) { create(:city_list) }
      let!(:city_list2) { create(:city_list) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      city_list1.id,
                                      city_list2.id,
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
                                      city_list2.id,
                                      city_list1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
