class DmvFacility
  attr_reader :locations,
              :ny_locations,
              :mo_locations,
              :or_locations

  def initialize
    @locations = []
    @ny_locations = []
    @mo_locations = []
    @or_locations = []
  end

  def create_facilities(all_office_locations)
    office_locations.map do |location| 
      if location.has_key?(:state) && location[:state] == "NY"
        create_ny_facilities(office_locations)
      elsif location.has_key?(:state) && location[:state] == "MO"
        create_mo_facilities(office_locations)
      else
        create_or_facilities(office_locations)
      end
    end
  end

  def create_or_facilities(office_locations)
    office_locations.map do |location|
      new_location = {
        name: location[:title],
        address: location[:location_1][:human_address],
        phone: location[:phone_number]
      }
        @or_locations << Facility.new(new_location)
      end
    @or_locations.map do |location|
      @locations << location 
    end
  end

  def create_ny_facilities(office_locations)
    office_locations.map do |location|
      new_location = {
        name: location[:office_name],
        address: location.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(' '),
        phone: location[:public_phone_number]
      }
      @ny_locations << Facility.new(new_location)
      end
    @ny_locations.map do |location|
      @locations << location 
    end
  end

  def create_mo_facilities(office_locations)
    office_locations.map do |location|
      new_location = {address: location.fetch_values(:address1, :city, :state, :zipcode).join(' ')}
      @mo_locations << Facility.new(new_location)
    end
    @mo_locations.map do |location|
      @locations << location 
    end
  end
end