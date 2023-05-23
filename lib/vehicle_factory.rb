class VehicleFactory
  def create_vehicles(registrations)
    vehicles = format(registrations)
    vehicles.map do |vehicle|
      Vehicle.new(vehicle)
    end
  end

  def format(registrations)
    all_formatted = []
      [registrations].flatten.each do |registration|
        formatted_registration = {}
        formatted_registration[:vin] = registration[:vin_1_10]
        formatted_registration[:year] = registration[:model_year].to_i
        formatted_registration[:make] = registration[:make]
        formatted_registration[:model] = registration[:model]
        formatted_registration[:engine] = :ev
        all_formatted << formatted_registration
      end
    all_formatted
  end
end