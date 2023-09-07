require './spec/spec_helper'
require './lib/vehicle_factory'
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

# co_dds = DmvDataService.new.co_dmv_office_locations
# co_facilities = FacilityFactory.new.create_facilities(co_dds)
# vehicle_dds = DmvDataService.new.wa_ev_registrations
# co_facilities.each { |facility| facility.add_service('Vehicle Registration') }
# cars = VehicleFactory.new.create_vehicles(vehicle_dds)
# cars.each{ |car| co_facilities.sample.register_vehicle(car)}