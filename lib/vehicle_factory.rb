class VehicleFactory 
  def create_vehicles(registrations)
   vehicles = []
    registrations.each do |registration|
      engine = :ev
      vin = registration[:vin_1_10]
      model_year = registration[:model_year]
      make = registration[:make]
      model = registration[:model]

      vehicle = Vehicle.new(:engine => :ev, :vin => :vin_1_10, :model_year => :model_year, :make => :make, :model => :model )
      vehicles << vehicle
    end
    vehicles
  end
end