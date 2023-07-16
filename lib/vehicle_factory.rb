class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    vehicles = []
    registrations.each do |registration|
      require 'pry';binding.pry
      registration[engine] = :ev
      vehicle = Vehicle.new({registration[:engine], registration[:make], registration[:model]})
      vehicles << vehicle
    end
    vehicles
  end
end