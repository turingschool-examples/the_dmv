class VehicleFactory

  def create_vehicles(data)
      created_vehicles = data.map do |vehicle_data|
        Vehicle.new(
          {
            vin: vehicle_data[:vin_1_10], 
            year: vehicle_data[:model_year],
            make: vehicle_data[:make],
            model: vehicle_data[:model],
            engine: :ev
          }
        )
      end
      require 'pry';binding.pry
  end 
end