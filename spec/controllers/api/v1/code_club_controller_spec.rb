require 'rails_helper'

RSpec.describe Api::V1::CodeClubController, type: :controller do
  let(:args) do
    {
      parent: {
        name: 'Parent Name',
        email: 'parent@example.com',
        phone_number: '039303030'
      },
      student: {
        name: 'Student One',
        level: 'SS3',
        address: '235 Ikorudo road',
        gender: 'Female',
        data: {
          has_programming_experience: true,
          personalComputer: true,
          availability: true,
          what_are_you_currently_doing: 'Gap year'
        }
      }
    }
  end

  describe '#apply' do
    context 'success' do
      it 'returns scuccessful response' do
        create(:school, school_type: 'code_club', center: 'Lagos')
        post :apply, params: args

        expect(response).to have_http_status(200)
        expect(json(response.body)[:success]).to be_present
      end
    end

    context 'failure' do
      it 'returns failure' do
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
        invalid_parent = { name: nil, email: nil, phone_number: nil, center: nil }

        post :apply, params: args.merge(parent: invalid_parent)

        expect(response).to have_http_status(400)
        expect(json(response.body)[:error]).to be_present
      end
    end
  end
end
