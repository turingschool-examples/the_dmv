class FacilityLocations
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_data)
      dmv_data.each do |facility|
      facility[:address] = facility.delete :address_li
      facility[:name] = facility.delete :dmv_office
      facility = Facility.new(facility)
      @facilities << facility
    end
  end
end