class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(data_service)
    @facilities = data_service.map do |facility|
      facility[:name] = facility[:dmv_office]
      facility[:address] = facility[:address_li]
      Facility.new(facility)
    end
  end
end