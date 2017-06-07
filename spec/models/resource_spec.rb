require 'rails_helper'

RSpec.describe Resource, type: :model do
  it { is_expected.to belong_to(:session).inverse_of(:resource) }

  it { is_expected.to have_many(:notes) }

  it { is_expected.to accept_nested_attributes_for(:notes) }
end
