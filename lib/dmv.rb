class Dmv
  attr_reader :facilities, :facility_count

  def initialize
    @facilities = []
    @facility_count = 0
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def add_facilities(facilities)
    facilities.each do |facility|
      facility[:name] = facility[:office_name]
      facility[:address] = facility[:street_address_line_1]
      facility[:phone] = facility[:public_phone_number]
      @facility_count += 1
      added_facility = Facility.new(facility)
      @facilities << added_facility
    end
  end

  def facility_by_zip(number)
    @facilities.select {|facility| facility.zip == "#{number}" }
  end
end
