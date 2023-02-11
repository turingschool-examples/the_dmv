require 'spec_helper'

class FacilityConstructor
  attr_reader :created_facilities
  def initialize
    @created_facilities = []
  end
  
  def create_facility(location_data)
    dmv_office_location = DmvDataService.new.or_dmv_office_locations
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
   if location_data == dmv_office_location
      dmv_office_location.each do |office|
        facility_info = {
          name: office[:title],
          address: office[:location_1][:human_address],
          phone: office[:phone_number],
          services: [],
          registered_vehicles: [],
          collected_fees: 0
        }
        @created_facilities << facility = Facility.new(facility_info)
      end
      @created_facilities
    elsif location_data == new_york_facilities
      new_york_facilities.each do |office|
        facility_info = {
          name: office[:office_name],
          address: [office[:street_address_line_1], office[:city], office[:state]],
          phone: office[:public_phone_number],
          services: [],
          registered_vehicles: [],
          collected_fees: 0
        }
        @created_facilities << facility = Facility.new(facility_info)
      end
    end
    @created_facilities
  end
end