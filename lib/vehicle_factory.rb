class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicles(state_registration)
    @created_vehicles = state_registration.map do |vehicle|
      Vehicle.new(
        vin: vehicle[:vin_1_10], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: :ev)
    end 
  end


end