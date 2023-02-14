class DmvLocations
  attr_reader :dmv_locations
  def initialize
    @dmv_locations = []
    
  end
  def create_dmv_locations(location_info_databases)
    location_info_databases.map do |location|
      new_facility = {
        name: location[:title],
        address: location[:location_1][:human_address],
        phone: location[:phone_number] 
      }
      @dmv_locations << Facility.new(new_facility)
    end
    @dmv_locations
  end

  def create_dmv_locations_2(location_database)
    location_database.map do |location|
      location[:address] = location[:street_address_line_1]
      location[:name] = location[:office_name]
      location[:phone] = location[:public_phone_number]
      facility1 = Facility.new(location)
      @dmv_locations << facility1
    end
  end
  
end

