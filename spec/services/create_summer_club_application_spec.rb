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
  describe 'success' do
    context 'with two children' do
      it 'creates two children and one parent' do
        create(:school)
        result = nil

        expect do
          expect do
            result = CreateSummerClubApplication.perform(args)
          end.to change(Parent, :count).by(1)
        end.to change(Student, :count).by(2)

        expect(result.succeeded?).to eq(true)
        expect(result.value.count).to eq(2)
        expect(enqueued_emails(SummerClubMailer, :registration_success).count).to eq(1)
      end
    end

    context 'with one child' do
      it 'creates one child and  a parent' do
        children = [{ name: 'Student One', level: 'SS3' }]
        create(:school)
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(
              args.merge(children: children)
            )
          end.to change(Parent, :count).by(1)
        end.to change(Student, :count).by(1)

        expect(result.succeeded?).to eq(true)
        expect(result.value.count).to eq(1)
      end
    end
  end

  describe 'failure' do
    context 'invalid parent params' do
      it 'fails' do
        create(:school)
        invalid_parent = { name: nil, email: nil, phone_number: nil, center: nil }
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(
              args.merge(parent: invalid_parent)
            )
          end.to change(Parent, :count).by(0)
        end.to change(User, :count).by(0)

        expect(result.failed?).to eq(true)
        expect_errors [:blank], result.reason.details[:name]
        expect_errors [:invalid], result.reason.details[:email]
        expect_errors [:blank], result.reason.details[:phone_number]
        expect_errors [:blank], result.reason.details[:center]
      end
    end

    context 'invalid student one params' do
      it 'fails' do
        children = [{ name: '', level: nil }]
        create(:school)
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(
              args.merge(children: children)
            )
          end.to change(Parent, :count).by(0)
        end.to change(Student, :count).by(0)

        expect(result.failed?).to eq(true)
        expect_errors [:blank], result.reason.details[:name]
      end
    end

    context 'invalid student two params' do
      it 'fails' do
        children = [
          { name: 'First Child', level: 'SS 1' },
          { name: nil, level: nil }
        ]
        create(:school)
        result = nil
        expect do
          expect do
            result = CreateSummerClubApplication.perform(
              args.merge(children: children)
            )
          end.to change(Parent, :count).by(0)
        end.to change(Student, :count).by(0)

        expect(result.failed?).to eq(true)
        expect_errors [:blank], result.reason.details[:name]
      end
    end
  end
end
