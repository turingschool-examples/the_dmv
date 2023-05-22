class VehicleFactory
  
  def create_vehicles(state_reg)
   state_reg.map do |registration|
    Vehicle.new({vin: registration[:vin_1_10],
     year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev}) 
   end
  end
end

