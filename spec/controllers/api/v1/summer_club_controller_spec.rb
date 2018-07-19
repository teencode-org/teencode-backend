require 'rails_helper'

RSpec.describe Api::V1::SummerClubController, type: :controller do
  let(:args) do
    {
      parent: {
        name: 'Parent Name',
        email: 'parent@example.com',
        phone_number: '039303030',
        center: 'Mainland'
      },
      children: [
        { name: 'Student One', level: 'SS3' },
        { name: 'Student Two', level: 'SS2' },
      ]
    }
  end

  describe '#apply' do
    context 'success' do
      it 'returns scuccessful response' do
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
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
