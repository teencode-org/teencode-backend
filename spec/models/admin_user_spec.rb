require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it do
    is_expected.to(
      have_many(:stories).class_name('Blog').with_foreign_key(:author_id)
    )
  end
end
