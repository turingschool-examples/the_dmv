class VehicleFactory
  attr_reader

  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(api_data)
    api_data.each do |data|
    vehicle = Vehicle.new(
      :vin data[:vin_1_10], 
      :make data[:make], 
      :model data[:model], 
      :year data[:year], 
      :engin data[:engine])
    @factory_vehicles << vehicle
    end
  end
end