class CreateSummerClubApplication < Base
  field :parent
  field :children

  def initialize(parent:, children:)
    @parent = parent
    @children = children
  end

  def perform
    create_parent
      .then { |parent| create_students(parent) }
      .on_success do |students|
        SummerClubMailer.registration_success(students.first.parent.id).deliver_later
      end
  end

  private

  def create_students(parent)
    Service::Result.all(
      children.map do |child|
        CreateStudent.perform(
          name: child[:name],
          level: child[:level],
          school: School.where('school_type = ? and center = ?', 'summer_club', parent[:center]).first,
          parent: parent
        )
      end
    )
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