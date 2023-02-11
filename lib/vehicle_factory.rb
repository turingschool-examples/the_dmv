class VehicleFactory
  attr_reader :vehicles, :create_vehicles

  def initialize
    @vehicles = []
  end
  
  def create_vehicles(wa_ev_registrations)
    wa_ev_registrations.each do |vehicle|
      vehicle_info = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        registration_date: nil,
        plate_type: nil
      }
      @vehicles << vehicle = Vehicle.new(vehicle_info)
      end
      @vehicles
    end
end