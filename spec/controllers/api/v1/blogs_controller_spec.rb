require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :controller do
  describe "GET #index" do
    context "when there are no blogs" do
      it "returns http status of not found" do
        get :index

        expect(response).to have_http_status(404)
      end
    end

    context "when there are blogs" do
      it "has a success status code" do
        create(:story)

        get :index

        expect(response).to have_http_status(200)
      end
    end
  end
end
