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

  def create_new_york_facilities
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    ny_dmv_office_locations.each do |data|
      facility = Facility.new(
        name: capitalize_words(data[:office_name]),
        address: parse_new_york_address(data),
        phone: data[:public_phone_number]
      )
      @facilities << facility
    end
  end

  def create_missouri_facilities
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    mo_dmv_office_locations.each do |data|
      facility = Facility.new(
        name: capitalize_words(data[:name]),
        address: parse_missouri_address(data),
        phone: data[:phone]
      )
      @facilities << facility
    end
  end

end
