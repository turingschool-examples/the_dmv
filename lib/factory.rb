class VehicleFactory

  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.each do |registration|
      vehicle = Vehicle.new(
        vin: registration[:vin_1_10],
        year: registration[:model_year],
        make: registration[:make],
        model: registration[:model],
        engine: :ev
      )
      @vehicles << vehicle
    end
  end
end