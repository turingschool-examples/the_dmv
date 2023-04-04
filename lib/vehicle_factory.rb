class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(state_registrations)
    state_registrations.map do |vehicle|
      vehicle_details = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        registration_date: nil
      }
      
      @vehicles << vehicle = Vehicle.new(vehicle_details)
      binding.pry
    end
  end


end
