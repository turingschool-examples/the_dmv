class VehicleFactory
  attr_accessor :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.each do |registration|
      vehicle = Vehicle.new(registration)
      vehicle.vin = registration[:vin_1_10]
      vehicle.year = registration[:model_year]
      vehicle.engine = :ev
     @vehicles << vehicle
    end
  end 
end