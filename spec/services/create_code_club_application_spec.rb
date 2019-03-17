require 'rails_helper'

RSpec.describe CreateCodeClubApplication, type: :service do
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
  describe 'success' do
    it 'creates two children and one parent' do
      create(:school, school_type: 'code_club', center: 'Lagos')
      result = nil

      expect do
        expect do
          result = CreateCodeClubApplication.perform(args)
        end.to change(Parent, :count).by(1)
      end.to change(Student, :count).by(1)

      expect(result.succeeded?).to eq(true)
      # expect(enqueued_emails(SummerClubMailer, :registration_success).length).to eq(1)
    end
  end

  describe 'failure' do
    it 'fails' do
      create(:school, school_type: 'code_club', center: 'Lagos')
      invalid_parent = { name: nil, email: nil, phone_number: nil, center: nil }
      result = nil
      expect do
        expect do
          result = CreateCodeClubApplication.perform(
            args.merge(parent: invalid_parent)
          )
        end.to change(Parent, :count).by(0)
      end.to change(User, :count).by(0)

      expect(result.failed?).to eq(true)
      expect_errors [:blank], result.reason.details[:name]
      expect_errors [:invalid], result.reason.details[:email]
      expect_errors [:blank], result.reason.details[:phone_number]
    end
  end
end
