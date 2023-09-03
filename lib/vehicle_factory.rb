class VehicleFactory

  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
        vehicles << Vehicle.new({
          vin: registration[:vin_1_10], 
          year: registration[:model_year], 
          model: registration[:model],
          make: registration[:make],
          engine: :ev})
      end
     vehicles
  end
end

# binding.pry


