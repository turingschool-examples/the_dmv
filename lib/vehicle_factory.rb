require 'json'

class VehicleFactory
  def create_vehicles(data)
    vehicles = []

    data.each do |d|
      d.transform_keys!(vin_1_10: :vin, model_year: :year)

      d[:engine] = :ev if d.has_key?(:electric_vehicle_type)

      vehicles << Vehicle.new(d)
    end

    return vehicles
  end
end
