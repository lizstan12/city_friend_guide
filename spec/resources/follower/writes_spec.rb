require "rails_helper"

RSpec.describe FollowerResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "followers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FollowerResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Follower.count }.by(1)
    end
  end

  describe "updating" do
    let!(:follower) { create(:follower) }

    let(:payload) do
      {
        data: {
          id: follower.id.to_s,
          type: "followers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FollowerResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { follower.reload.updated_at }
      # .and change { follower.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:follower) { create(:follower) }

    let(:instance) do
      FollowerResource.find(id: follower.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Follower.count }.by(-1)
    end
  end
end
