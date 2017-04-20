require 'rails_helper'

RSpec.describe 'Applicants' do
  describe 'listing all applicants' do
    before(:all) do
      create_list(:applicant, 3)
      get '/api/v1/applicants'
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'should return 3 applicants' do
      expect(json(response.body)[:applicants].count).to eq 3
    end
  end

  describe 'show' do
    before(:all) do
      applicant = create(:applicant, name: 'James Franco')
      get "/api/v1/applicants/#{applicant.id}"
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'should return details of the applicant' do
      expect(json(response.body)[:name]).to eq 'James Franco'
    end
  end

  describe 'create' do
    before(:all) do
      post '/api/v1/applicants', attributes_for(:applicant, name: 'James Franco')
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 201
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns details of the newly created applicant' do
      expect(json(response.body)[:name]).to eq('James Franco')
    end
  end

  describe 'update' do
    before(:all) do
      applicant = create(:applicant)
      put "/api/v1/applicants/#{applicant.id}", attributes_for(:applicant, name: 'James Franco')
    end

    it 'should return a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'returns json data' do
      expect(response.content_type).to eq Mime::JSON
    end

    it 'returns details of the newly created applicant' do
      expect(json(response.body)[:name]).to eq('James Franco')
    end
  end

  describe 'delete' do
    it "should reduce applicant count by one" do
    applicant = create(:applicant)
      expect do
        delete("/api/v1/applicants/#{applicant.id}")
      end.to change(Applicant, :count).by(-1)
    end
  end
end
