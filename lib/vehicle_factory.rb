class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(json)
    json.each do |vehicle|
      new_vehicle = Vehicle.new({
        vin: vehicle[:"vin_1_10"], 
        year: vehicle[:"model_year"].to_i, 
        make: vehicle[:"make"], 
        model: vehicle[:"model"], 
        engine: :ev
      })
      @vehicles << new_vehicle
    end
  end
end