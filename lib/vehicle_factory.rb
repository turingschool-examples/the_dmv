class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    vehicle_data = []
    data.each do |data_hash|
      vehicle_details = {}
      vehicle_details[:vin] = data_hash[:vin_1_10]
      vehicle_details[:year] = data_hash[:model_year]
      vehicle_details[:make] = data_hash[:make]
      vehicle_details[:model] = data_hash[:model]
      vehicle_details[:engine] = :ev
      vehicle_data << vehicle_details
    end
    vehicle_data.each do |vehicle_details|
      @vehicles << Vehicle.new(vehicle_details)
    end
    @vehicles
  end
end
