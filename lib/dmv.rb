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

  private

  def capitalize_words(string)
    string.split.map(&:capitalize).join(' ')
  end

  def parse_oregon_address(human_address)
    address_data = JSON.parse(human_address)
    "#{address_data['address']}, #{address_data['city']}, #{address_data['state']}, #{address_data['zip']}"
  end

  def parse_new_york_address(data)
    state = data[:state].upcase
    address = "#{data[:street_address_line_1]}, #{data[:city]}, #{state}, #{data[:zip_code]}"
    capitalize_words(address)
  end

  # I would make this the standard one and then build custom for states that don't match this
  def parse_missouri_address(data)
    "#{data[:address1]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}"
  end
end
