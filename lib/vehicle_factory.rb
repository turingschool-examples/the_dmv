class VehicleFactory


  def create_vehicles(registrations = [])
    vehicles = []

    registrations.each do |registration|
      vehicle_details = {
        vin: registration[:vin],
        year: registration[:year].to_i,
        make: registration[:make],
        model: registration[:model],
        engine: :ev, # Assuming all registrations are for electric vehicles
        registration_date: nil # You can set this to the registration date if available in the data
      }

      vehicle = Vehicle.new(vehicle_details)
      vehicles << vehicle
    end

    vehicles
  end
end