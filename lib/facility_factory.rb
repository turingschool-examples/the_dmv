require 'json'

class FacilityFactory
  attr_reader :new_facilities
              :or
              :ny
              :mo
  def initialize
    @or = []
    @ny = []
    @mo = []
    @new_facilities = []
  end

  def create_facility(hash)
    facility = Facility.new(hash)
    @new_facilities << facility
  end

  def create_facilities(state, data)
    if state == 'or'
      create_or_facilities
    elsif state == 'ny'
      create_ny_facilities
    end
  end

  def create_or_facilities(locations)
    locations.each do |location|
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
    
  end
end