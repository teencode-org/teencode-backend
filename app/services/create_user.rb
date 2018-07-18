class CreateUser < Service::Create
  field :name
  field :is_active
  field :school
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
    super(User)
  end
end