require "rails_helper"

RSpec.describe FacilitatorGuide, type: :model do
  it { is_expected.to have_and_belong_to_many(:authors) }
  it { is_expected.to accept_nested_attributes_for(:authors) }

  let!(:prev_guide) { create(:facilitator_guide) }
  let!(:guide) { create(:facilitator_guide) }
  let!(:next_guide) { create(:facilitator_guide) }

  describe "#next" do
    it "will return the very next facilitor guide" do
      expect(guide.next).to eql next_guide
    end

    it "will return the previous facilator guide" do
      expect(guide.previous).to eql prev_guide
    end
  end
end
