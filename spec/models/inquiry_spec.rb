require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  subject{ create(:inquiry) }

  describe 'instance methods' do
    it { is_expected.to respond_to :phone_number }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :message }
  end

  describe 'model validations' do
    it { should validate_presence_of :phone_number }
    it { should validate_presence_of :email }
    it { should validate_presence_of :message }
  end
end
