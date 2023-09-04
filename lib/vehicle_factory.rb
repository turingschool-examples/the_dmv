class VehicleFactory
  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
      engine = :ev
      make = registration[:make]
      model = registration[:model]
      vin = registration[:vin_1_10]
      model_year = registration[:model_year]

      vehicle = Vehicle.new(engine: , make: , model:, vin: , model_year: )
      vehicles << vehicle
    end 
    vehicles
  end 
end              