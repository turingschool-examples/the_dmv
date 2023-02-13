class VehicleFactory  
  def initialize
  end

  def create_vehicles(car_registration_info)
    new_cars = []
    car_registration_info.each do |info|
      vehicle_details_hash = {
        :engine => :ev,
        :vin => :vin_1_10,
        :year => :model_year,
        :make => :make,
        :model => :model,
      }
      new_cars << Vehicle.new(vehicle_details_hash)
    end
    new_cars
  end
  
  
end