class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(vehicles)
  #  vehicles.map do |vehicle|
  #   vehicle.keys.uniq
  #  end
  #  vehicles << veh
  ## Lightbulb
  # each do
  #   first, change certain keys to correct keys matching vehicle class
  #   v1 = Vehicle.new(wa_ev_registrations[0]), pass in default value of engine :ev
  #   add engine type to be ev, bonus if you can make it so that it does so based on whether the data passed in includes ev
  # end

      # Vehicle.new
      # vehicle[:make] = vehicle_details[:make]
  end
end