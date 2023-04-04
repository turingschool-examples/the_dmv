class VehicleFactory
  def create_vehicles(cars)
     cars.map do |registration|
       Vehicle.new(make: registration[:make], model: registration[:model], year: registration[:model_year],
                   vin: registration[:vin_1_10], engine: :ev)
     end
   end
 end