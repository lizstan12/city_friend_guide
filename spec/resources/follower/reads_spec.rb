require "rails_helper"

RSpec.describe FollowerResource, type: :resource do
  describe "serialization" do
    let!(:follower) { create(:follower) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(follower.id)
      expect(data.jsonapi_type).to eq("followers")
    end
  end

  describe "filtering" do
    let!(:follower1) { create(:follower) }
    let!(:follower2) { create(:follower) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: follower2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([follower2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:follower1) { create(:follower) }
      let!(:follower2) { create(:follower) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      follower1.id,
                                      follower2.id,
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
                                      follower2.id,
                                      follower1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
