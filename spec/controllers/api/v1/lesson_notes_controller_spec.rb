require "rails_helper"

RSpec.describe Api::V1::LessonNotesController, type: :controller do
  describe "#show" do
    context "when valid sessions are passed" do
      context "when a valid lesson note id is sent" do
        it "should return a successful response" do
          note = create(:lesson_note)

          get :show, params: { session_id: note.session.id, id: note.id }

          expect(response).to have_http_status(200)
        end

        it "should return the lesson note as well as the author" do
          note = create(:lesson_note, authors: create_list(:author, 2))

          get :show, params: { session_id: note.session.id, id: note.id }

          expect(json(response.body)[:authors]).to be_present
        end
      end

      context "when an invalid lesson note is requested" do
        let(:session) { session = create(:session) }

        it "should return without a body" do
          get :show, params: { session_id: session.id, id: "fake id" }

          expect(response.body).to be_empty
        end

        it "should return a not found status" do
          get :show, params: { session_id: session.id, id: "fake id" }

          expect(response).to have_http_status(404)
        end
      end
    end

    context "when an invalid session is passed" do
      before do
        get :show, params: { session_id: "fake id", id: "anything" }
      end

      it "should return a status of 403" do
        expect(response).to have_http_status(403)
      end

      it "should return a meaningful message" do
        expect(json(response.body)[:error]).to eql "Invalid session id"
      end
    end
  end
end
