class VehicleFactory
  attr_reader :vehicles

  def initialize
  end
  
  def create_vehicles(vehicle_data)
    @vehicles = []

    vehicle_data.each do |car|
      make = car[:make]
      model = car[:model]
      vin = car[:vin_1_10]
      year = car[:model_year]

      vehicle_details = {
        engine: :ev,
        make: make,
        model: model,
        plate_type: nil,
        registration_date: nil,
        vin: vin,
        year: year
      }

      vehicle = Vehicle.new(vehicle_details)
      
      vehicles << vehicle
    end

    vehicles.inspect
  end
end
