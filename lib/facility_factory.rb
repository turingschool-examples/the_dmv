class FacilityFactory
  attr_reader :new_facilities
  def initialize
    @new_facilities = []
  end

  def create_facility(hash)
    facility = Facility.new(hash)
    @new_facilities << facility
  end
end