class VehicleFactory

  def create_vehicles(registrations)
    registrations.map do |registration|
      vehicle_info = {engine: :ev}
      vehicle_info[:vin] = registration[:vin_1_10]
      vehicle_info[:year] = registrations.first[:model_year]
      vehicle_info[:make] = registration[:make]
      vehicle_info[:model] = registration[:model]
      vehicle_info[:plate_type] = registration.first[:plate_type]
      vehicle_info[:registration_date] = registration[:transaction_date]

      Vehicle.new(vehicle_info)
    end

  end

end
