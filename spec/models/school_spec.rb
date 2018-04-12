require 'rails_helper'

RSpec.describe School, type: :model do
  it { is_expected.to have_many(:reports) }
  it { is_expected.to belong_to(:facilitator) }
end
