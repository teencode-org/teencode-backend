class CreateCodeClubApplication < Base
  field :parent
  field :student

  def initialize(parent:, student:)
    @parent = parent
    @student = student
  end

  def perform
    create_parent
      .then { |parent| create_student(parent) }
      .on_success do |student|
        SummerClubMailer.registration_success(student.parent_id).deliver_later
      end
  end

  private

  def create_student(parent)
    CreateStudent.perform(
      name: student[:name],
      level: student[:level],
      school: School.where('school_type = ? and center = ?', 'code_club', 'Lagos').first,
      gender: student[:gender],
      address: student[:address],
      data: student[:data],
      parent: parent
    )
  end

  def create_parent
    CreateParent.perform(
      name: parent[:name],
      email: parent[:email],
      phone_number: parent[:phone_number],
      center: 'Epic Tower',
      location: 'Lagos'
    )
  end
end