require 'rails_helper'

RSpec.describe 'SummerClub', type: :request do
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

  describe 'applying' do
    context 'success' do
      it 'returns successful response' do
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
        expect do
          expect do
            post '/api/v1/summer-club/apply', params: args
          end.to change(Parent, :count).by(1)
        end.to change(User, :count).by(2)

        expect(response).to have_http_status(200)
        expect(json(response.body)[:success]).to be_present
      end
    end

    context 'failure' do
      it 'returns error message' do
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
        invalid_parent = { name: nil, email: nil, phone_number: nil, center: nil }

        expect do
          expect do
            post '/api/v1/summer-club/apply', params: args.merge(parent: invalid_parent)
          end.to change(Parent, :count).by(0)
        end.to change(User, :count).by(0)

        expect(response).to have_http_status(400)
        expect(json(response.body)[:error]).to be_present
      end
    end
  end
end
