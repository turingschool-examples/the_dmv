require './spec/spec_helper'

class VehicleFactory
  def create_vehicles(dds_region)
    dds_region.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end
end

ny_dds = DmvDataService.new.ny_dmv_registrations
ny_vehicles = VehicleFactory.new.create_vehicles(ny_dds)

require 'pry'; binding.pry