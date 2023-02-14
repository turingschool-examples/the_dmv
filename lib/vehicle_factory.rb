class VehicleFactory

  def initialize
  end

  def create_vehicles(vehicles)
    if vehicles[0].keys.include?(:electric_vehicle_type)
      vehicles.map do |vehicle|
        vehicle_details = {
          vin: vehicle[:vin_1_10],
          year: vehicle[:model_year],
          make: vehicle[:make],
          model: vehicle[:model],
          engine: :ev
        }
        Vehicle.new(vehicle_details)
      end
    else
      vehicles.map do |vehicle|
        vehicle_details = {
          vin: vehicle[:vin_1_10],
          year: vehicle[:model_year],
          make: vehicle[:make],
          model: vehicle[:model],
          engine: :ice
        }
        Vehicle.new(vehicle_details)
      end
    end
  end
end