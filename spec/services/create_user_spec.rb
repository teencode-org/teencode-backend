require 'rails_helper'

RSpec.describe CreateUser, type: :service do
  it 'success' do
    result = CreateUser.perform(attributes_for(:user))

    expect(result.succeeded?).to eq(true)
    expect(result.value.name).to be_truthy
    expect(result.value.is_active).to be_truthy
  end

  describe 'failure' do
    context '#name' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateUser.perform(attributes_for(:user, name: v))

          expect(result.failed?).to be_truthy
          expect_errors [:blank], result.reason.details[:name]
        end
      end
    end
  end
end
