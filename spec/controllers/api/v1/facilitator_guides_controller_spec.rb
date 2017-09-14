require "rails_helper"

RSpec.describe Api::V1::FacilitatorGuidesController, type: :controller do
  describe "#show" do
    context "when a valid facilitator guide id is sent" do
      it "should return a successful response" do
        guide = create(:facilitator_guide)

        get :show, params: { id: guide.id }

        expect(response).to have_http_status(200)
      end

      it "should return the facilitator guide as well as the author" do
        guide = create(:facilitator_guide, authors: create_list(:author, 2))

        get :show, params: { id: guide.id }

        expect(json(response.body)[:authors]).to be_present
      end
    end

    context "when an invalid facilitator guide is requested" do
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
