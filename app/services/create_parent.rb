class CreateParent < Service::Create
  field :name
  field :email
  field :phone_number
  field :center
  field :location

  def initialize(name:, email:, phone_number:, center:, location:)
    @name = name
    @email = email
    @phone_number = phone_number
    @center = center
    @location = location
  end

  def perform
    super(Parent)
  end
end