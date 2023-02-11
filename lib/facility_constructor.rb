require 'spec_helper'

class FacilityConstructor
  def initialize
    @created_facilities = []
  end
  
  def create_facility(location_data)
    dmv_office_location = DmvDataService.new.or_dmv_office_locations
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
  end
end