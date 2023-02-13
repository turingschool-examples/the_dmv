class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    vehicles_with_dup = []
    data.each do |car|
      vehicle_details = {
        make: car[:make],
        model: car[:model],
        vin: car[:vin_1_10] += car[:dol_vehicle_id],
        year: car[:model_year].to_i,
        engine: :ev
      }
      vehicles_with_dup << Vehicle.new(vehicle_details)
    end
    @vehicles = vehicles_with_dup.uniq {|vehicle| vehicle.vin}
    @vehicles
  end
end