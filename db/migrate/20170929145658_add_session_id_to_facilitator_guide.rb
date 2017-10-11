class AddSessionIdToFacilitatorGuide < ActiveRecord::Migration[5.0]
  def change
    add_reference :facilitator_guides, :session, foreign_key: true
  end
end
