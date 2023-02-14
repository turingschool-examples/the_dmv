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
  
  
end

