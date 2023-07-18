class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
      registration[:engine] = :ev

      vehicle = Vehicle.new({
        vin: registration[:vin_1_10],
        year: registration[:model_year],
        make: registration[:make],
        model: registration[:model],
        engine: registration[:engine]
      })

      vehicles << vehicle
    end
    vehicles
  end
end
