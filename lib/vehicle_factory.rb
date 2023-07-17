class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
      registration[:engine] = :ev
      new_vehicle = Vehicle.new({
        engine: registration[:engine],
        make: registration[:make],
        model: registration[:model],
        plate_type: registration[:plate_type],
        registration_date: registration[:registration_date],
        vin: registration[:vin_1_10],
        year: registration[:model_year]
      })
      vehicles << new_vehicle
    end
    vehicles
  end
end