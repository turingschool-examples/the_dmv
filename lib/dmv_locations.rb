require 'json'

class DMVLocation
  attr_reader :locations
  
  def initialize
    @locations = []
  end


  def dmv_locations(office_locations)
    office_locations.each do |location|
      location_info = location[:location_1][:human_address]
      address = JSON.parse(location_info, symbolize_names: true)
      facility = Facility.new(location)
      facility.name = location[:title]
      facility.address = address[:address]
      facility.phone = location[:phone_number]
      @locations << facility
    end
  end
end
