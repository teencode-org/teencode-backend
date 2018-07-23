require 'rails_helper'

RSpec.describe CreateSchool, type: :service do
  it 'success' do
    result = CreateSchool.perform(attributes_for(:school))

    expect(result.succeeded?).to eq(true)
    expect(result.value.name).to be_truthy
    expect(result.value.address).to be_truthy
    expect(result.value.school_type).to be_truthy
    expect(result.value.location).to be_truthy
    expect(result.value.center).to be_truthy
  end

  describe 'failure' do
    describe('#name') do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateSchool.perform(attributes_for(:school, name: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:name]
        end
      end
    end

    describe('#address') do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateSchool.perform(attributes_for(:school, address: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:address]
        end
      end
    end

    describe('#location') do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateSchool.perform(attributes_for(:school, location: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:location]
        end
      end
    end

    describe('#school_type') do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateSchool.perform(attributes_for(:school, school_type: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:school_type]
        end
      end
    end

    describe('#center') do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateSchool.perform(attributes_for(:school, center: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:center]
        end
      end
    end
  end
end
