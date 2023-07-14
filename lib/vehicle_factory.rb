class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
      registrations.each do |vehicle|
        details = {
          engine: :ev,
          make: vehicle[:make],
          model: vehicle[:model],
          vin: vehicle[:vin_1_10],
          year: vehicle[:model_year]
        }
        @vehicles << Vehicle.new(details)
      end
  end

end
