class Dmv
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def add_multiple_facilities(state_facilities_data)
    state_facilities_data.each do |facility|
      # For CO facilities
      facility_details = {
        name: facility[:dmv_office],
        address: "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}",
        phone: facility[:phone], 
      }
      # CO specifies services provided, all only provide registration
      new_facility = Facility.new(facility_details)
      new_facility.services << 'Vehicle Registration'
      @facilities << new_facility
    end
  end
end
