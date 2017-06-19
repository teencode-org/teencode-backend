require "rails_helper"

RSpec.describe "Sessions" do
  describe "GET #index" do
    let(:sessions_path) {"/api/v1/curriculum_sessions"}

    context "when there are sessions" do
      before do
        create_list(:session, 3)

        get sessions_path
      end

      it "returns a status code of success" do
        expect(response).to have_http_status(200)
      end

      it { expect(json(response.body).count).to eql 3 }
    end

    describe "includes their resource" do
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

    context "when there are no sessions" do
      before do
        get sessions_path
      end

      it "returns a response of status 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a bodiless response" do
        expect(response.body).to be_empty
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when session has resource, project and objective' do
      let(:session_with_rpo) { create(:session) }

      it 'should delete session with all its rpo and thier associated notes' do
        expect {
          delete
        }
      end
    end

    context 'when session does not have resource, project and objective' do

    end
  end
end
