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

  def create_oregon_facilities
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    or_dmv_office_locations.each do |data|
      facility = Facility.new(
        name: data[:title],
        address: parse_oregon_address(data[:location_1][:human_address]),
        phone: data[:phone_number]
      )
      require 'pry'; binding.pry
      @facilities << facility
    end
  end

end
