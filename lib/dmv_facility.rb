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
  
  def create_facilities(office_locations)
    if office_locations.first[:state] == "NY"
      create_ny_facilities(office_locations)
    elsif office_locations.first[:state] == "MO"
      create_mo_facilities(office_locations)
    else
      create_or_facilities(office_locations)
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
      @locations << Facility.new(new_location)
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
      @locations << Facility.new(new_location)
    end
  end

  def create_mo_facilities(office_locations)
    office_locations.map do |location|
      new_location = {address: location.fetch_values(:address1, :city, :state, :zipcode).join(' ')}
      @mo_locations << Facility.new(new_location)
      @locations << Facility.new(new_location)
    end
  end
end