require './spec/spec_helper'
# require './lib/dmv_data_service'
# require './lib/facility'

class FacilityFactory
  
  def create_facilities(dds_data)
    facilities = dds_data.map do |facility|
      Facility.new(facility)
    end
    facilities
  end
end

co_dds = DmvDataService.new.co_dmv_office_locations
co_facilities = FacilityFactory.new.create_facilities(co_dds)
car_dds = DmvDataService.new.wa_ev_registrations
co_facilities[0].add_service('Vehicle Registration')
car = Vehicle.new(car_dds[0])
co_facilities[0].register_vehicle(car)
require 'pry'; binding.pry