class School < ApplicationRecord
  has_many :reports
  belongs_to :facilitator, class_name: 'User', foreign_key: 'lead_facilitator_id'
end
