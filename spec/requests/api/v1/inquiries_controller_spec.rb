require 'rails_helper'

RSpec.describe 'Inquiries' do
  describe 'listing all inquiries' do
    before(:all) do
      create_list(:inquiry, 3)
      get '/api/v1/inquiries'
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'should return 3 inquirys' do
      expect(json(response.body)[:inquiries].count).to eq 3
    end
  end

  describe 'show' do
    before(:all) do
      inquiry = create(:inquiry, phone_number: '081086474838')
      get "/api/v1/inquiries/#{inquiry.id}"
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'should return details of the inquiry' do
      expect(json(response.body)[:phone_number]).to eq '081086474838'
    end
  end

  describe 'create' do
    before(:all) do
      post '/api/v1/inquiries', attributes_for(:inquiry, phone_number: '081086474838')
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 201
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns details of the newly created inquiry' do
      expect(json(response.body)[:phone_number]).to eq('081086474838')
    end
  end

  describe 'update' do
    before(:all) do
      inquiry = create(:inquiry)
      put "/api/v1/inquiries/#{inquiry.id}", attributes_for(:inquiry, phone_number: '081086474838')
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns details of the newly created inquiry' do
      expect(json(response.body)[:phone_number]).to eq('081086474838')
    end
  end

  describe 'delete' do
    it "should reduce inquiry count by one" do
    inquiry = create(:inquiry)
      expect do
        delete("/api/v1/inquiries/#{inquiry.id}")
      end.to change(Inquiry, :count).by(-1)
    end
  end
end
