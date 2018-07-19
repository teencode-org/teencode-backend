class CreateSchool < Service::Create
  field :name
  field :address
  field :lead_facilitator_id
  field :location
  field :school_type
  field :is_active
  field :center

  def initialize(name:, location:, lead_facilitator_id:, school_type:, is_active:, address:, center:)
    @name = name
    @address = address
    @lead_facilitator_id = lead_facilitator_id
    @location = location
    @school_type = school_type
    @is_active = is_active
    @center = center
  end

  def perform
    super(School)
  end
end
