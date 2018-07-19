require 'rails_helper'

RSpec.describe CreateUser, type: :service do
  it 'success' do
    school = create(
      :school,
      lead_facilitator_id: create(:user, school_id: 0).id
    )
    result = CreateUser.perform(attributes_for(:user, school: school))

    expect(result.state).to eq(true)
    expect(result.value).to be_an_instance_of(User)
  end

  # describe 'failure' do
  #   it 'returns field errors' do
  #     result = CreateUser.perform(
        #   attributes_for(:user, name: '', type: nil, school: nil)
        # )

  #     expect(result.state).to eq(false)
  #     expect(result.value.errors.messages[:name]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:school_id]).to eq(["can't be blank"])
  #     expect(result.value.errors.messages[:type]).to eq(["can't be blank"])
  #   end
  # end
end
