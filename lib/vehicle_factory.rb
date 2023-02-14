class VehicleFactory  
#  attr_reader :dmv_locations
  def initialize
    # @dmv_locations = []
  end

  def create_vehicles(car_registration_info)
    new_cars = []
    car_registration_info.each do |info|

    info[:engine] = :ev
    info[:vin] = info[:vin_1_10]
    info[:year] = info[:model_year]
    
      new_cars << Vehicle.new(info)
    end
    new_cars
  end
  

  
end