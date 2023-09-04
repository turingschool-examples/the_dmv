class VehicleFactory 
  attr_reader :production_list,
              :vehicle_details

  def create_vehicles_helper(data)
    @production_list = data.map do |car|
      car = car.slice(:vin_1_10, :model_year, :make, :model, :electric_vehicle_type,)
      @vehicle_details = car.map do |key, value|
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
    end
  end

  def create_vehicles(data)
    self.create_vehicles_helper(data)
    cars = @production_list.map do |car|
      Vehicle.new(car)
    end
  end
end

