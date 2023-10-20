class VehicleFactory 
  def create_vehicles(registrations)
   vehicles = []
    registrations.each do |registration|
      engine = :ev
      vin = registration[:vin_1_10]
      model_year = registration[:model_year]
      make = registration[:make]
      model = registration[:model]

      vehicle = Vehicle.new(engine: , vin:, model_year: , make:, model: )
      vehicles << vehicle
    end
    vehicles
  end
end