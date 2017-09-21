require "rails_helper"

RSpec.describe Api::V1::LessonNotesController, type: :controller do
  describe "#show" do
    context "when a valid lesson note id is sent" do
      it "should return a successful response" do
        guide = create(:lesson_note)

        get :show, params: { id: guide.id }

        expect(response).to have_http_status(200)
      end

      it "should return the lesson note as well as the author" do
        guide = create(:lesson_note, authors: create_list(:author, 2))

        get :show, params: { id: guide.id }

        expect(json(response.body)[:authors]).to be_present
      end
    end

    context "when an invalid lesson note is requested" do
      it "should return without a body" do
        get :show, params: { id: "fake id" }

        expect(response.body).to be_empty
      end

      it "should return a not found status" do
        get :show, params: { id: "fake id" }

        expect(response).to have_http_status(404)
      end
    end
  end
end
