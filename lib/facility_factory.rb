class FacilityFactory
  attr_reader :state_factilities
  def initialize
    @state_factilities = []
  end

  def store_facitlities(database)
    database.each { |facility_data| 
    @state_factilities << Facility.new(facility_data)
  }
  end
end
