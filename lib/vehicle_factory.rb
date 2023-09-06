class VehicleFactory

  def initialize
  end

  def create_vehicles(registration)
    vehicles = registration.map do |vehicle|
      vin = vehicle[:vin_1_10]
      year = vehicle[:model_year]
      make = vehicle[:make]
      model = vehicle[:model]

      vehicle = Vehicle.new(vin: vin, year: year, make: make, model: model, engine: :ev)
    end
  end
end
