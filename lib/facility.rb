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
    if self.services.include?('Vehicle Registration') == false
      return nil
    else
      vehicle.set_plate_type(vehicle)
      self.collect_fees(vehicle)
      vehicle.register_vehicle_date
      @registered_vehicles << vehicle
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique? == true
      @collected_fees += 25
    elsif 
      vehicle.electric_vehicle? == true
      @collected_fees += 200
    else 
      @collected_fees += 100
    end
  end

end
