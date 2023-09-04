class VehicleFactory
  attr_reader

  def initialize
  end

  def create_vehicles(api_data)
    vehicles = api_data.map do |data|
    Vehicle.new(
      vin: data[:vin_1_10], 
      make: data[:make], 
      model: data[:model], 
      year: data[:model_year], 
      engine: :ev)
    end
  end
end