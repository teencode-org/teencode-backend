require 'rails_helper'

RSpec.describe CreateParent, type: :service do
  it 'success' do
    result = CreateParent.perform(attributes_for(:parent))

    expect(result.succeeded?).to eq(true)
    expect(result.value.name).to be_truthy
    expect(result.value.email).to be_truthy
    expect(result.value.phone_number).to be_truthy
    expect(result.value.center).to be_truthy
    expect(result.value.location).to be_truthy
  end

  describe 'failure' do
    context '#name' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateParent.perform(attributes_for(:parent, name: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:name]
        end
      end
    end

    context '#email' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateParent.perform(attributes_for(:parent, email: v))

          expect(result.failed?).to eq(true)
          expect_errors [:invalid], result.reason.details[:email]
        end
      end
    end

    context '#phone_number' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateParent.perform(attributes_for(:parent, phone_number: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:phone_number]
        end
      end
    end

    context '#center' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateParent.perform(attributes_for(:parent, center: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:center]
        end
      end
    end

    context '#location' do
      it 'missing' do
        ['', ' ', nil].each do |v|
          result = CreateParent.perform(attributes_for(:parent, location: v))

          expect(result.failed?).to eq(true)
          expect_errors [:blank], result.reason.details[:location]
        end
      end
    end
  end
end
