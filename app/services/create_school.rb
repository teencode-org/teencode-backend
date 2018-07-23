class CreateSchool < Service::Create
  field :name, presence: true
  field :address, presence: true
  field :location, presence: true
  field :school_type, presence: true
  field :center, presence: true
  field :is_active
  field :lead_facilitator_id

  def initialize(name:, location:, lead_facilitator_id: nil, school_type:, is_active:, address:, center:) # rubocop:disable Metric/Length
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