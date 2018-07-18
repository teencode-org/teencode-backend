class CreateSchool
  include ActiveModel::Model

  attr_accessor :name, :address, :is_active, :location, :type


  def save
    @school = School.new(
      name: name,
      address: address,
      is_active: is_active,
      location: location,
      type: type
    )
    persist
  end

  private

  def persist
    if @school.save
      handle_suceess
    else
      handle_failure
    end
  end

  def promote_errors(child_errors)
    child_errors.each do |attribute, message|
      errors.add(attribute, message)
    end
  end

  def handle_suceess
    true
  end

  def handle_failure
    promote_errors(@school.errors)
    false
  end
end