class VehicleFactory
  attr_accessor :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    data.each do |car|
        vin = car[:vin_1_10]
        year = car[:model_year]
        make = car[:make]
        model = car[:model]

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


      @vehicles << car
    end
    vehicles.inspect
  end

end    