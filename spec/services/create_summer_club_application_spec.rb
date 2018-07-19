require 'rails_helper'

RSpec.describe CreateSummerClubApplication, type: :service do
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

  it 'success' do
    create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
    result = nil

    expect do
      expect do
        result = CreateSummerClubApplication.perform(args)
      end.to change(Parent, :count).by(1)
    end.to change(User, :count).by(2)

    expect(result.state).to eq(true)
  end

  describe 'failure' do
    context 'invalid parent params' do
      it 'fails' do
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
        invalid_parent = { name: nil, email: nil, phone_number: nil, center: nil }
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(args.merge(parent: invalid_parent))
          end.to change(Parent, :count).by(0)
        end.to change(User, :count).by(0)

        expect(result.state).to eq(false)
      end
    end

    context 'invalid student one params' do
      it 'creates only one student' do
        children = [{ name: 'Student One', level: 'SS3' }]
        create(:school, lead_facilitator_id: create(:user, school_id: 0).id)
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(args.merge(children: children))
          end.to change(Parent, :count).by(1)
        end.to change(User, :count).by(1)

        expect(result.state).to eq(true)
      end
    end
  end
end
