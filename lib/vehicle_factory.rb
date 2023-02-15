class VehicleFactory
  
  def create_vehicles(data)
    data.map do |vehicle| ## map the data being passed through in order to reformat into data structure I want
      formatted_data = {
        vin: vehicle[:vin_1_10], ## making the data key the new value and matching it to the original key
        year: vehicle[:model_year], ## "                                                                "
        engine: vehicle[:electric_vehicle_type] ? :ev : :ice, ## ternary operator evaluates left of ? and decides which side of : to use
        make: vehicle[:make], ## Same as line 6
        model: vehicle[:model] ## Same as line 6
      }
      Vehicle.new(formatted_data)  ## Returning a new instance of the Vehilce class with the reformated data
    end

  end
end