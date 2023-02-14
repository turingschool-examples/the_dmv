class VehicleFactory
  
  def create_vehicles(data)
    data.map do |vehicle|
      formatted_data = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        engine: vehicle[:electric_vehicle_type] ? :ev : :ice, ## ternary operator evaluates left of ? and decides which side of : to use
        make: vehicle[:make],
        model: vehicle[:model]
      }
      Vehicle.new(formatted_data)
    end

  end
end