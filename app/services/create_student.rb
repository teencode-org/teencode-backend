class CreateStudent < Service::Create
  field :name, presence: true
  field :level
  field :level
  field :gender
  field :school, presence: true
  field :parent, presence: true

  def initialize(name:, level: nil, gender: nil, school:, parent:)
    @name = name
    @level = level
    @gender = gender
    @school = school
    @parent = parent
  end

  def perform
    super(Student)
  end
end
