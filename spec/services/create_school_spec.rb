require 'rails_helper'

RSpec.describe CreateSchool, type: :service do
  it 'success' do
    user = create(:user, school_id: 0)
    result = CreateSchool.perform(attributes_for(:school, lead_facilitator_id: user.id))

    expect(result.state).to eq(true)
    expect(result.value).to be_an_instance_of(School)
  end

  # describe 'failure' do
  #   it 'returns field errors' do
  #     result = CreateSchool.perform(attributes_for(:school, name: '', address: nil, lead_facilitator_id: nil, school_type: nil))

  #     expect(result.state).to eq(false)
  #     expect(result.value.errors.messages[:name]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:address]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:school_type]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:lead_facilitator_id]).to eq(["can't be blank"])
  #   end
  # end
end
