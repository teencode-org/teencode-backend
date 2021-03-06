require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'GET #index' do
    let(:sessions_path) { '/api/v1/curriculum_sessions' }

    context 'when there are sessions' do
      before do
        create_list(:session, 3)

        get sessions_path
      end

      it 'returns a status code of success' do
        expect(response).to have_http_status(200)
      end

      it { expect(json(response.body).count).to eql 3 }
    end

    describe 'includes their resource' do
      before do
        create_list(:session_with_resources, 2)

        get sessions_path
      end

      it do
        expect(json(response.body).all? do |session|
          session[:resource].present?
        end).to eql true
      end
    end

    describe 'session has lesson_note and facilitator_guide' do
      it 'returns lesson_note and facilitator_guide' do
        session = create(:session_with_lesson_note_and_facilitator_guide)
        get sessions_path
        expect(response.status).to eq(200)
        json(response.body).each do |session|
          expect(session[:facilitator_guides][0]).not_to be_nil
          expect(session[:lesson_notes][0]).not_to be_nil
        end
      end
    end

    context 'when there are no sessions' do
      before do
        get sessions_path
      end

      it 'returns a response of status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a bodiless response' do
        expect(response.body).to be_empty
      end
    end
  end
end
