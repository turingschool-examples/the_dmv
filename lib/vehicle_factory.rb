class VehicleFactory

  
  def initialize
  end

  def create_vehicles(location)
    location.each do |vehicle|
      vehicle = Vehicle.new(@vehicle_details)
      if vehicle[:vin, :year, :make, :model, :engine] == 
        new_car[:key] = vehicle.value
      require 'pry'; binding.pry
    end

  end
end