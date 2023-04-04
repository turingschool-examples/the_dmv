class VehicleFactory
  def initialize()

  end
 
  def create_vehicles(registration_location)
    registration_location.map do |registration|
      Vehicle.new(
        engine: :ev,
        make: registration[:make],
        model: registration[:model],
        vin: registration[:vin_1_10],
        year: registration[:model_year]
        )
    end
  end
end