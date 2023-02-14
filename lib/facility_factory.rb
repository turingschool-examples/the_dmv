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

  def create_facilities(state, locations = nil)
    if state == 'or'
      create_or_facilities(locations)
    elsif state == 'ny'
      create_ny_facilities(locations)
    elsif state == 'mo'
      create_mo_facilities(locations)
    else "State unavailable!"
    end
  end

  def create_or_facilities(locations)
    locations.map do |location|
      require 'pry'; binding.pry
      data = location[:location_1][:human_address]
      address = JSON.parse(data, symbolize_names: true)
      location[:name] = location[:title]
      location[:phone] = location[:phone_number]
      location[:address] = address[:address]
      facility = Facility.new(location)
      @new_facilities << facility
    end
  end

  def create_ny_facilities(locations)
    locations.each do |location|
      location[:address] = location[:street_address_line_1]
      location[:name] = location[:office_name]
      location[:phone] = location[:public_phone_number]
      facility = Facility.new(location)
      @new_facilities << facility
    end
  end

  def create_mo_facilities(locations)
    locations.each do |location|
      location[:address] = location[:address1]
      location[:name]
      facility = Facility.new(location)
      @new_facilities << facility
    end
  end
end