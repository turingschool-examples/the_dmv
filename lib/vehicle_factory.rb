class VehicleFactory

  def create_vehicles(registrations)
    registrations.map do |registration|
      vehicle_info = {engine: :ev, plate_type: :ev}
      vehicle_info[:vin] = registration[:vin_1_10]
      vehicle_info[:year] = registration[:model_year].to_i
      vehicle_info[:make] = registration[:make]
      vehicle_info[:model] = registration[:model]
# require 'pry'; binding.pry
      vehicle_info[:registration_date] = registration[:transaction_date]

      Vehicle.new(vehicle_info)
    end
  end
end
