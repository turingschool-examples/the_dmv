require 'json'
require './lib/facility'
require './lib/dmv_data_service'

class FacilityLocations
  def create_facilities(facilities)
    if facilities.first.include?(:zip_code)
      zipcode = facilities.first[:zip_code]
    else
      zipcode = facilities.first[:zipcode]
    end
    location = zipcode_locator(zipcode)
    if location == "OR"
      or_facilities(facilities)
    end
  end

  def zipcode_locator(zipcode)
    zipcode = zipcode.to_i
    if zipcode.between?(97001, 97920)
      return "OR"
    elsif zipcode.between?(63001, 65899)
      return "MO"
    elsif zipcode.between?(10001, 14975) || zipcode == 6390
      return "NY"
    end
  end

  def or_facilities(facilities)
    facilities.map do |facility|
      formatted_address = format_or_address(facility[:location_1][:human_address])
      Facility.new({
        name: facility[:title],
        address: formatted_address,
        phone: facility[:phone_number],
      })
    end
  end

  def format_or_address(raw_address)
    parsed = JSON.parse(raw_address)
    parsed.values.join(" ")
  end


end


locations = FacilityLocations.new
or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

  #* Oregon 97***
  #* NY 6390 OR 10001 - 14975
  #* MO 6390 OR 63001 - 65899

  # raw = "{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"

  # parsed = JSON.parse(raw_2)
  # p parsed
  # p parsed.values.join(" ")
p or_dmv_office_locations.first.include?(:zip_code)
