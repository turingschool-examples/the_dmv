class VehicleFactory
  attr_reader :created_vehicles 
  
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(vehicle_details)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_registrations(vehicle_details)
    @created_vehicles
  end 
  
   # Helper method
  def wa_registrations(vehicle_details)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_ev_registrations.each do |car|
      vehicle_details = {
        vin: car[:vin_1_10],
        year: car[:model_year].to_i,
        make: car[:make],
        model: car[:model],
        engine: "ev",
      }
      created_vehicles << (vehicle = Vehicle.new(vehicle_details))
    end
  end
end