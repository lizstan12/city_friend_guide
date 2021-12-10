require "rails_helper"

RSpec.describe EntryResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "entries",
          attributes: {},
        },
      }
    end

    let(:instance) do
      EntryResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Entry.count }.by(1)
    end
  end

  describe "updating" do
    let!(:entry) { create(:entry) }

    let(:payload) do
      {
        data: {
          id: entry.id.to_s,
          type: "entries",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      EntryResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { entry.reload.updated_at }
      # .and change { entry.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:entry) { create(:entry) }

    let(:instance) do
      EntryResource.find(id: entry.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Entry.count }.by(-1)
    end
  end
end
