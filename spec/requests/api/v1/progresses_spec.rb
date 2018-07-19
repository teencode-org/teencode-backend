require 'rails_helper'

RSpec.describe 'Progresses' do
  describe '#index' do
    let(:progress_path) { '/api/v1/progresses' }
    before do
      create(:progress)

      get progress_path
    end

    it 'should render a progress object' do
      expect(json(response.body)[:progress]).to be_present
    end
  end
end
