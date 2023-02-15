require_relative 'facility'
require_relative 'dmv_data_service'

class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
  
  def create_vehicles(source)
    source.each do |vehicle_hash|
    saved_vehicles = {}
    saved_vehicles[:vin] = vehicle_hash[:vin_1_10]
    saved_vehicles[:year] = vehicle_hash[:model_year]
    saved_vehicles[:make] = vehicle_hash[:make]
    saved_vehicles[:model] = vehicle_hash[:model]
    saved_vehicles[:engine] = :ev
    saved_vehicles[:plate_type] = :ev
    @vehicles << Vehicle.new(saved_vehicles)
    end
  end
end