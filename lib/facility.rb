class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle (vehicle)
    return nil unless (@services.include?('Vehicle Registration'))
      @registered_vehicles << vehicle
      collect_fees(vehicle)
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.engine == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    vehicle.assign_registration_date(Date.today)
    @registered_vehicles
  end

  def administer_written_test (registrant)
    return false unless ((@services.include?('Written Test')) && 
        (registrant.age >= 16))
      registrant.pass_written_test
  end

  def administer_road_test (registrant)
    return false unless ((@services.include?('Road Test')) && 
        (registrant.license_data[:written] == true))
      registrant.pass_road_test
  end  

  def renew_drivers_license (registrant)
    return false unless ((@services.include?('Renew License')) && 
        (registrant.license_data[:written] == true) && 
        (registrant.license_data[:license] == true))
      
      registrant.renew_license
  end  
end
