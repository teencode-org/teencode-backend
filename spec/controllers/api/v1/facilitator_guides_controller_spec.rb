require "rails_helper"

RSpec.describe Api::V1::FacilitatorGuidesController, type: :controller do
  describe "#show" do
    context "when a valid facilitator guide id is sent" do
      it "should return a successful response" do
        guide = create(:facilitator_guide)

        get :show, params: { id: guide.id, session_id: guide.session.id }

        expect(response).to have_http_status(200)
      end

      it "should return the facilitator guide as well as the author" do
        guide = create(:facilitator_guide, authors: create_list(:author, 2))

        get :show, params: { id: guide.id, session_id: guide.session.id }

        expect(json(response.body)[:authors]).to be_present
      end
    end

    context "when an invalid facilitator guide is requested" do
      before(:each) do
        @session = create(:session)

        get :show, params: { id: "fake id", session_id: @session.id }
      end

      it "should return without a body" do
        expect(response.body).to be_empty
      end

      it "should return a not found status" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
