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

  def administer_written_test(registrant)
     return false if self.services.include?('Written Test') == false
      return false if registrant.age <= 15 || registrant.permit? != true
      # registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
      true
  end

  def administer_road_test(registrant)
    return false if self.services.include?('Road Test') == false
      return false if registrant.license_data[:written] == false
      registrant.license_data[:license] = true
      true
  end

  def renew_drivers_license(registrant)
    return false if self.services.include?('Renew License') == false
      return false if registrant.license_data[:license] == false
      registrant.license_data[:renewed] = true
      true
  end
end
