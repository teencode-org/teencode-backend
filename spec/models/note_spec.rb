require 'rails_helper'

RSpec.describe Note, type: :model do
  it { is_expected.to belong_to(:notable) }
end
