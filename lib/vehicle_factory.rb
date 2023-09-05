class VehicleFactory
  attr_reader :factory_vehicles
  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(state_registrations_data)
    # For now, since only washington, all are EV, so :ev is hard coded
    state_registrations_data.each do |vehicle|
      vehicle_details = {
        vin: vehicle[:dol_vehicle_id], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: :ev
      }
      @factory_vehicles << Vehicle.new(vehicle_details)
    end
  end
end