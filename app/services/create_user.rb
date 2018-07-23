class CreateUser < Service::Create
  field :name, presence: true
  field :is_active
  field :school

  def initialize(name:, is_active: false, school: nil)
    @name = name
    @school = school
    @is_active = is_active
  end

  def perform
    super(User)
  end
end
