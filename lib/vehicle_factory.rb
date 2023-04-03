class VehicleFactory
  def initialize
  end
  def create_vehicles(api)
    api.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin_1_10], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: [:ev]
        })
    end
  end
end