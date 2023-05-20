class VehicleFactory
  attr_reader :new_vehicles

  def initialize
    @new_vehicles = []
  end

  def create_vehicles(state_registrations)
    state_registrations.select do |vehicle|
      model = vehicle[:model]
      vin = vehicle[:vin_1_10]
      year = vehicle[:model_year]
      make = vehicle[:make]

      new_vehicle = Vehicle.new({vin: vin, year: year, make: make, model: model, engine: :ev})
      @new_vehicles << new_vehicle
    end
    @new_vehicles
  end
end