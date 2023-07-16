class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
      # require 'pry';binding.pry
      registration[:engine] = :ev
      #need to refactor below; throwing syntax error
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