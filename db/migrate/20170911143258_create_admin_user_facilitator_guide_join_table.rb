class CreateAdminUserFacilitatorGuideJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :admin_users, :facilitator_guides do |t|
      t.index [:admin_user_id, :facilitator_guide_id], name: "user_guide"
      t.index [:facilitator_guide_id, :admin_user_id], name: "guide_user"
    end
  end
end
