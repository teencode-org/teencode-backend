class CreateParent < Service::Create
  field :name, presence: true
  field :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  field :phone_number, presence: true
  field :center, presence: true
  field :location, presence: true

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
