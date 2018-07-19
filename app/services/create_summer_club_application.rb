class CreateSummerClubApplication < Base
  field :parent
  field :children

  def initialize(parent:, children:)
    @parent = parent
    @children = children
  end

  def perform
    Parent.transaction do
      create_parent
      User.transaction do
        create_students
      end
    end
    Base::Result.new(true, nil)
  rescue => e
    # binding.pry
    Raven.capture_exception(
      e,
      message: e.message,
      extra: { parent: parent, children: children }
    )
    Base::Result.new(false, e.message)
  end

  private

  def create_students
    children.map do |child|
      CreateUser.perform(
        name: child[:name],
        level: child[:level],
        location: 'Lagos',
        center: parent[:center],
        school: School.where('school_type = ? and center = ?', 'summer_club', parent[:center]).first,
        type: 'student'
      )
    end
  end

  def create_parent
    CreateParent.perform(
      name: parent[:name],
      email: parent[:email],
      phone_number: parent[:phone_number],
      center: parent[:center],
      location: 'Lagos'
    )
  end
end
