class School < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :lead_facilitator_id, presence: true
  validates :location, presence: true
  validates :school_type, presence: true

  has_many :reports
  belongs_to :facilitator, class_name: 'User', foreign_key: 'lead_facilitator_id'

  SUMMER_CLUB_LAGOS = {
    'Mainland' => where(school_type: 'summer_club', center: 'Mainland').first,
    'Island' =>   where(school_type: 'summer_club', center: 'Island').first
  }.freeze

  def summer_club_mainland; end

  def summer_club_island
    where(shool_type: 'summer_club', center: 'Island')
  end
end
