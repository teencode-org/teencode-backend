class CreateCodeCampLagosSchool < ActiveRecord::Migration[5.0]
  def change
    CreateSchool.perform(
      name: 'Code Camp Lagos',
      address: '235 Ikorodu Road',
      location: 'Mainland',
      school_type: 'code_camp',
      center: 'Lagos',
      is_active: true
    )
  end
end
