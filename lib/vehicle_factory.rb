require 'date'

class VehicleFactory
  def initialize
    @new_vehicles = []
  end

  def create_vehicles(remote_data)
    remote_data.each do |data|
      vehicle = Vehicle.new(
        vin: data[:vin_1_10],
        year: data[:model_year],
        make: data[:make],
        model: data[:model],
        engine: :ev)
      @new_vehicles << vehicle
    end
    @new_vehicles
  end
end