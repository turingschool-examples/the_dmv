require 'json'
require './lib/facility'
require './lib/dmv_data_service'

class FacilityLocations
  def create_facilities(facilities)
    facilities.map do |facility|
      formatted_address = format_address(facility[:location_1][:human_address])
      Facility.new({
        name: facility[:title],
        address: formatted_address,
        phone: facility[:phone_number],
      })
    end
  end

  def format_address(raw_address)
    parsed = JSON.parse(raw_address)
    parsed.values.join(" ")
  end


end


#locations = FacilityLocations.new
# or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

  

  # raw = "{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"

  # parsed = JSON.parse(raw_2)
  # p parsed
  # p parsed.values.join(" ")