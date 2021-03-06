require 'rails_helper'

RSpec.describe 'Admin Sessions', type: :feature do
  before(:each) do
    FactoryGirl.create(
      :admin_user,
      email: 'admin@example.com',
      super_user: true
    )
  end

  scenario 'sessions with rpo with their associated notes' do
    create(:session_with_rpo)

    login

    click_link 'Sessions'

    expect(page).to have_content 'Sessions'

    click_link 'Delete'

    expect(page).to have_content 'Session was successfully destroyed.'
  end
end
