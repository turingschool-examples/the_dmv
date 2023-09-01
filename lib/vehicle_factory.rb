class VehicleFactory

  def initialize
  end

  def create_vehicles(registrations)
    vehicles = registrations.map do |registration|
      vin = registration[:vin_1_10]
      year = registration[:model_year]
      make = registration[:make]
      model = registration[:model]

      vehicle = Vehicle.new(vin: vin, year: year, make: make, 
      model: model, engine: :ev)
    end
  end
end