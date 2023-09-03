class VehicleFactory
  def initalize
  end
  
  def create_vehicle(registrations)
    create_vehicle = []
    registrations.map do |registration|
      vehicle_details = {vin: registration[:vin_1_10], year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev}
      vehicle = Vehicle.new(vehicle_details)
      create_vehicle << vehicle
    end
    create_vehicle
  end
end