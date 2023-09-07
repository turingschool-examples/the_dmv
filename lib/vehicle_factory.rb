require './spec/spec_helper'

class VehicleFactory
  def create_vehicles(dds_region)
    dds_region.map do |vehicle_data|
      Vehicle.new(vehicle_data)
    end
  end
end