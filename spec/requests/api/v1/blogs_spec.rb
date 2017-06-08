require "rails_helper"

RSpec.describe "Blogs" do
  before(:all) do
    create(:story)

    get "/api/v1/blogs"
  end

  describe "listing all stories" do
    it "returns json data" do
      expect(response.content_type).to eq Mime[:json]
    end

    it "should return 1 story" do
      expect(json(response.body)[:blogs].count).to eq 1
    end

    it "should also return pagination metadata" do
      expect(json(response.body)[:page_data]).to be_present
    end
  end
end
