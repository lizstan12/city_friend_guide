require "rails_helper"

RSpec.describe EntryResource, type: :resource do
  describe "serialization" do
    let!(:entry) { create(:entry) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(entry.id)
      expect(data.jsonapi_type).to eq("entries")
    end
  end

  describe "filtering" do
    let!(:entry1) { create(:entry) }
    let!(:entry2) { create(:entry) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: entry2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([entry2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:entry1) { create(:entry) }
      let!(:entry2) { create(:entry) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      entry1.id,
                                      entry2.id,
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
                                      entry2.id,
                                      entry1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
