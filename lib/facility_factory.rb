class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(data_service)
    data_service.each do |facility|
      facility[:name] = facility[:dmv_office]
      facility[:address] = facility[:address_li]
      @facilities << Facility.new(facility)
    end
  end
end