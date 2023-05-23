class VehicleFactory
  attr_reader :wa_ev_vehicles
 
  def initialize
    @wa_ev_vehicles = []
  end
 
  def create_vehicles(state_reg)
   @wa_ev_vehicles = state_reg.map do |registration|
    Vehicle.new({vin: registration[:vin_1_10],
     year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev}) 
   end
  end
end

