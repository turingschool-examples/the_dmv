class Vehicle_detail_handler
  attr_reader :registered_vehicles
  def facility_reader(facility)
    if facility == (@wa_ev_registrations)
      @registered_vehicles = car_registrations.map do |parts|
      parts[:vin] = parts[:vin_1_10]
      parts[:model] = parts[:model_year]
      parts[:year] = parts[:model_year]
      parts[:make] = parts[:make]
      parts[:model] = parts[:model]
        @a = @registered_vehicles.map do |car|
          Vehicle.new(car)
          
        end
      end
    end
  end
end