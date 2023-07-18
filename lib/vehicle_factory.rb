require "./lib/vehicle"

class VehicleFactory
  def create_vehicles(data)
    vehicles = []

    data.each do |data|
      vehicle_details = {
        vin: data[:vin],
        year: data[:year],
        make: data[:make],
        model: data[:model],
        engine: data[:engine]
      }
    end
  end
end
