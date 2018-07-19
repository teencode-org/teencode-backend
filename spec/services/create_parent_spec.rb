require 'rails_helper'

RSpec.describe CreateParent, type: :service do
  it 'success' do
    result = CreateParent.perform(attributes_for(:parent))

    expect(result.state).to eq(true)
    expect(result.value).to be_an_instance_of(Parent)
  end

  # describe 'failure' do
  #   it 'returns field errors' do
  #     result = CreateParent.perform(attributes_for(:parent, name: '', email: nil))

  #     expect(result.state).to eq(false)
  #     expect(result.value.errors.messages[:name]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:email]).to eq(["can't be blank"])
  #   end
  # end
end
