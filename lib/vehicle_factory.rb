class VehicleFactory


  def create_vehicles(registrations)
    vehicles = []

    registrations.each do |registration|
      vehicle_details = {
        vin: registration[:vin_1_10],
        year: registration[:model_year].to_i,
        make: registration[:make],
        model: registration[:model],
        engine: :ev,
        registration_date: nil 
      }

      vehicle = Vehicle.new(vehicle_details)
      vehicles << vehicle
    end

    vehicles
  end
end