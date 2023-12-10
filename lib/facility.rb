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
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.engine == :ev
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      vehicle.registration_date = Date.today
      @registered_vehicles
    else
      nil
    end
  end

  def administer_written_test (registrant)
    if ((@services.include?('Written Test')) && 
        (registrant.age >= 16))
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  def administer_road_test (registrant)
    if ((@services.include?('Road Test')) && 
        (registrant.license_data[:written] == true))
      registrant.license_data[:license] = true
      registrant.earn_permit
      true
    else
      false
    end
  end  

  def renew_drivers_license (registrant)
    if ((@services.include?('Renew License')) && 
        (registrant.license_data[:written] == true) && 
        (registrant.license_data[:license] == true))
      
      registrant.license_data[:renewed] = true
      true
    else
      false
    end
  end  
end
