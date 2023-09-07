require './spec/spec_helper'

class VehicleFactory
  def create_vehicles(dds_region)
    dds_region.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end
end

# ny_dds = DmvDataService.new.ny_dmv_registrations
# ny_vehicles = VehicleFactory.new.create_vehicles(ny_dds)
# co_dds = DmvDataService.new.co_dmv_office_locations
# facility = FacilityFactory.new.create_facilities(co_dds[0])
# facility.add_service('Vehicle Registration')
# registered = facility.register_vehicle(ny_vehicles[0])

# require 'pry'; binding.pry