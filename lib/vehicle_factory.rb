class VehicleFactory

  def create_vehicles(registrations)
      vehicles = format(registrations)
      vehicles.map do |vehicle|
          Vehicle.new(vehicle)
      end
  end

  def format(registrations)
      formatted = []
      [registrations].flatten.each do |registration|
          newformat = {}
          newformat[:vin] = registration[:vin_1_10]
          newformat[:year] = registration[:model_year]
          newformat[:make] = registration[:make]
          newformat[:model] = registration[:model]
          newformat[:engine] = :ev
          formatted << newformat
      end
      formatted
  end
end