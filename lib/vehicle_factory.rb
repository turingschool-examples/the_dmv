class VehicleFactory
  attr_accessor :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.each do |registration|
    vehicle = Vehicle.new(registration)
      # require 'pry'; binding.pry
      @vin = registration[:vin_1_10]
    @vehicles << [vehicle]
    end
  end
end