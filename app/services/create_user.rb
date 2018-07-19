class CreateUser < Service::Create
  field :name
  field :is_active
  field :school
  field :center
  field :location
  field :type
  field :level

  def initialize(name:, is_active: false, center:, location:, school:, type:, level:)
    @name = name
    @center = center
    @location = location
    @school = school
    @is_active = is_active
    @type = type
    @level = level
  end

  def perform
    super(User)
  end
end
