require 'rails_helper'

RSpec.describe CreateUser, type: :service do
  it 'success' do
    result = CreateUser.perform(attributes_for(:user))

    expect(result.state).to eq(true)
    expect(result.value).to be_an_instance_of(User)
  end

  describe 'failure' do
    it 'returns field errors' do
      result = CreateUser.perform(attributes_for(:user, name: '', email: nil))

      expect(result.state).to eq(false)
      expect(result.value.errors.messages[:name]).to eq(["can't be blank"])
      expect(result.value.errors.messages[:email]).to eq(["can't be blank"])
    end
  end
end