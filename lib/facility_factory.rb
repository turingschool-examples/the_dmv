require 'json'

class FacilityFactory
  attr_reader :new_facilities
  def initialize
    @new_facilities = []
  end

  def create_facility(hash)
    facility = Facility.new(hash)
    @new_facilities << facility
  end

  # def create_facilities(locations)
  #   locations.each do |location|
  #     data = location[:location_1][:human_address]
  #     address = JSON.parse(data, symbolize_names: true)
  #     facility = Facility.new(location)
  #     facility.name = location[:title]
  #     facility.address = address[:address]
  #     facility.phone = location[:phone_number]
  #     @new_facilities << facility
  #   end
  # end

  def create_facilities(locations)
    locations.each do |location|
      location[:address] = location[:street_address_line_1]
      location[:name] = location[:office_name]
      location[:phone] = location[:public_phone_number]
      facility = Facility.new(location)
      @new_facilities << facility
    end
  end
end