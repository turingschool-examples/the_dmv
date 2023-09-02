require './spec/spec_helper'

class VehicleFactory
  def create_vehicles(dds_region)
    dds_region.map do |ev_data|
      Vehicle.new(ev_data)
    end
  end
  pry.binding
end
