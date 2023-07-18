require "./lib/vehicle"

class VehicleFactory

  def create_vehicle(data)
    vin = data[:vin]
    year = data[:year]
    make = data[:make]
    model = data[:model]
    engine = :ev
  end
end

  def create_vehicles(vehicle_data)
    vehicle_data.map do |data|
      create_vehicle(vehicle_data)
    end
  end
