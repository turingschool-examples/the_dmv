class VehicleFactory

  def initialize
    @vehicles = []
  end

  def create_vehicles(vehicle_registration_data)
    vehicle_registration_data.each do |vehicle_registration_hash|
      make = vehicle_registration_hash[:make]
      vin = vehicle_registration_hash[:vin_1_10]
      model = vehicle_registration_hash[:model]
      year = vehicle_registration_hash[:year]
      @vehicles << Vehicle.new({vin: vin, make: make, model: model, year: year, engine: :ev})
    end
    @vehicles
  end

end