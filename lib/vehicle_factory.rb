class VehicleFactory
  attr_accessor :vehicle_instances

  def initialize
    @vehicle_instances = []
  end

  def create_electric_vehicles(state_vehicle_registrations)
    #for each hash, a new vehicle needs to be created (and stored into an array?)
    @vehicle_instances = state_vehicle_registrations.map do |vehicle|
      (Vehicle.new(
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      ))
    end
  end

end

