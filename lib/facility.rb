class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique? == true
      vehicle.plate_type = :antique && self.collected_fees += 25
    elsif 
      vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev && self.collected_fees += 200
    else 
      vehicle.plate_type = :regular && self.collected_fees += 100
    end
    @registered_vehicles << vehicle
  end
end
