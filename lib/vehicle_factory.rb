class VehicleFactory 
  attr_reader :cars

  def create_vehicles(data)
    @cars = data.map do |car|     
      vehicle_details = car.map do |key, value|     
        key.to_sym
        if key == :electric_vehicle_type
          key = :engine, value = :ev
        elsif key == :vin_1_10
          key = :vin, value = value
        elsif key == :model_year
          key = :year, value = value.to_i
        else
          key = key, value = value
        end
      end.to_h
      Vehicle.new(vehicle_details)
    end
  end
  @cars
end

