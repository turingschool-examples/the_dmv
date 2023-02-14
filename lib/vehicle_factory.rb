require_relative 'facility'
require_relative 'dmv_data_service'

class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
  def create_vehicles(source)
    source.each do |vehicle_hash|
    hash = {}
    hash[:vin] = vehicle_hash[:vin_1_10]
    hash[:year] = vehicle_hash[:model_year]
    hash[:make] = vehicle_hash[:make]
    hash[:model] = vehicle_hash[:model]
    hash[:engine] = :ev
    hash[:plate_type] = :ev
    # hash[:vin] = vehicle_hash[:vin_1_10]
    @vehicles << Vehicle.new(hash)
    end
  end
end