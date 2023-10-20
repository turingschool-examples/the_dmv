require_relative './vehicle'
require_relative './dmv_data_service'

class VehicleFactory
  attr_accessor :vehicle_instances

  def initialize
    @vehicle_instances = []
  end

  def create_electric_vehicles(state_vehicle_registrations)
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

