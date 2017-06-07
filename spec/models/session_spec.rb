require 'rails_helper'

RSpec.describe Session, type: :model do
  it { is_expected.to have_one(:project).inverse_of(:session) }
  it { is_expected.to have_one(:resource).inverse_of(:session) }
  it { is_expected.to have_one(:objective).inverse_of(:session) }

  it { is_expected.to accept_nested_attributes_for(:project) }
  it { is_expected.to accept_nested_attributes_for(:resource) }
  it { is_expected.to accept_nested_attributes_for(:objective) }
end
