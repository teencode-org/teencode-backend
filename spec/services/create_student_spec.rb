require 'rails_helper'

RSpec.describe CreateStudent, type: :service do
  it 'success' do
    result = CreateStudent.perform(
      attributes_for(
        :student,
        parent: build(:parent),
        school: build(:school)
      )
    )

    expect(result.succeeded?).to be_truthy
    expect(result.value.name).to be_truthy
    expect(result.value.level).to be_truthy
    expect(result.value.gender).to be_truthy
    expect(result.value.school).to be_truthy
    expect(result.value.parent).to be_truthy
  end

  describe 'failures' do
    context '#name' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateStudent.perform(
            attributes_for(
              :student,
              name: v,
              parent: build(:parent),
              school: build(:school)
            )
          )

          expect(result.failed?).to be_truthy
          expect_errors [:blank], result.reason.details[:name]
        end
      end
    end

    context '#parent' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateStudent.perform(
            attributes_for(
              :student,
              parent: v,
              school: build(:school)
            )
          )

          expect(result.failed?).to be_truthy
          expect_errors [:blank], result.reason.details[:parent]
        end
      end
    end

    context '#school' do
      it 'missing' do
        result = CreateStudent.perform(
          attributes_for(
            :student,
            parent: build(:parent),
            school: nil
          )
        )

        expect(result.failed?).to be_truthy
        expect_errors [:blank], result.reason.details[:school]
      end
    end
  end
end
