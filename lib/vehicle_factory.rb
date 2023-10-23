class VehicleFactory 
  def create_vehicles(registrations)
   
   vehicles = registrations.map do |registration|
      engine = :ev
      vin = registration[:vin_1_10]
      model_year = registration[:model_year]
      make = registration[:make]
      model = registration[:model]

      vehicle = Vehicle.new(engine: engine, vin: vin, year: model_year, make: make, model: model )
    end
    # require 'pry'; binding.pry
  end
end