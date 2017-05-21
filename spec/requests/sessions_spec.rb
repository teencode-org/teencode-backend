require 'rails_helper'

RSpec.describe Session, type: :request do
  subject{ create(:session)}

  describe "destroying a session" do

    it 'should delete the session and all associated record' do
      delete "/sessions/#{subject.id}"

      expect(response.status).to eq 200
    end
  end
end
