require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { is_expected.to belong_to(:author) }

  it { is_expected.to validate_presence_of(:author) }
end
