class VehicleFactory
  def initialize; end

  def create_vehicles(data)
    data.map do |vehicle_data|
      vin = vehicle_data[:vin_1_10]
      make = vehicle_data[:make]
      model = vehicle_data[:model]
      year = vehicle_data[:model_year]
    end
  end
end
