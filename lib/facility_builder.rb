require_relative 'facility'
require_relative 'dmv_data_service'
require 'json'

class FacilityBuilder
  attr_reader :locations
  def initialize
    @locations = []
  end

  def load_locations(source)
    if source == DmvDataService.new.or_dmv_office_locations
    source.each do |location_hash|
      data = location_hash[:location_1][:human_address]
      json_data = JSON.parse(data)

      # format == '2242 Santiam Hwy SE Albany OR 97321'
      street = json_data["address"]
      city = json_data["city"]
      state = json_data["state"]
      zip = location_hash[:zip_code]
      saved_locations = {}
      address_string = "#{street} #{city} #{state} #{zip}"

      saved_locations[:name] = location_hash[:title]
      saved_locations[:address] = address_string
      saved_locations[:phone] = location_hash[:phone_number]
      # saved_loacations[:services] = location_hash (no services listed in hash)
      # saved_loacations[:registered_vehicles] = location_hash (not in hash)
      # saved_loacations[:collected_fees] = location_hash (not in hash)
    @locations << saved_locations
    end
  elsif source == DmvDataService.new.ny_dmv_office_locations
    source.each do |location_hash|
      street = location_hash[:street_address_line_1]
      city = location_hash[:city]
      state = location_hash[:state]
      zip = location_hash[:zip_code]
      saved_locations = {}
      address_string = "#{street} #{city} #{state} #{zip}"


      saved_locations[:name] = location_hash[:office_name]
      saved_locations[:address] = address_string
      saved_locations[:phone] = location_hash[:public_phone_number]
      @locations << saved_locations
    end
  elsif source == DmvDataService.new.mo_dmv_office_locations
    source.each do |location_hash|
      street = location_hash[:address1]
      city = location_hash[:city]
      state = location_hash[:state]
      zip = location_hash[:zipcode]
      saved_locations = {}
      address_string = "#{street} #{city} #{state} #{zip}"

      saved_locations[:name] = location_hash[:name]
      saved_locations[:address] = address_string
      saved_locations[:phone] = location_hash[:phone]
      @locations << saved_locations
    end
  else 
    return false
  end
  end
end