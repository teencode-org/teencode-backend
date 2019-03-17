class CreateStudent < Service::Create
  field :name, presence: true
  field :level
  field :level
  field :gender
  field :school, presence: true
  field :parent, presence: true
  field :address
  field :data

  def initialize(name:, level: nil, gender: nil, school: nil, parent:, address:, data: {})
    @name = name
    @level = level
    @gender = gender
    @school = school
    @parent = parent
    @address = address
    @data = data
  end

  def perform
    super(Student)
  end
end
