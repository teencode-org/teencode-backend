require "rails_helper"

RSpec.describe Api::V1::ProgressesController, type: :controller do
  before do
    create(:progress)
  end

  describe "#index" do
    it "should have a success status code" do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
