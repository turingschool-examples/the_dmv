class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.map do |registration|
      new_vehicle = Vehicle.new({
      vin: registration[:vin_1_10],
      year: registration[:model_year],
      make: registration[:make],
      model: registration[:model],
      engine: :ev})
        vehicles << new_vehicle
    end
  end
end