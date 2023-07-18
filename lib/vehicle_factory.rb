class VehicleFactory
  def initialize

  end

  def create_vehicles(data)
    vehicles = []
    data.each do |api_data|
      vehicle_details = Hash.new
      vehicle_details[:vin] = api_data[:vin_1_10]
      vehicle_details[:year] = api_data[:model_year]
      vehicle_details[:make] = api_data[:make]
      vehicle_details[:model] = api_data[:model]
      vehicle_details[:engine] = :ev
      vehicles << Vehicle.new(vehicle_details)
    end
    vehicles
  end

  def detail_builder(vehicle_data)
    {
      vin: vehicle_data[:vin_1_10],
      year: vehicle_data[:model_year],
      make: vehicle_data[:make],
      model: vehicle_data[:model],
      engine: :ev
    }
  end
end