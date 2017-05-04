require 'rails_helper'

RSpec.describe Applicant, type: :model do
  subject{ create(:applicant) }

  describe 'instance methods' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :profession }
    it { is_expected.to respond_to :reason_for_applying }
    it { is_expected.to respond_to :phone_number }
    it { is_expected.to respond_to :email }
  end

  describe 'model validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone_number }
    it { should validate_presence_of :email }
  end
end
