class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle_helper(car)
    if car.antique?
      @collected_fees += 25
      car.plate_type = :antique
    elsif car.electric_vehicle?
      @collected_fees += 200
      car.plate_type = :ev
    else 
      @collected_fees += 100
      car.plate_type = :regular
    end
  end
  
  def set_registration_date(car)
    car.registration_date = Date.today
    @registered_vehicles << car
  end 

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      register_vehicle_helper(car)
      set_registration_date(car)

      @registered_vehicles
    end
  end

  def written_test_helper(registrant)
    if registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      registrant.license_data[:written]
    else 
      registrant.license_data[:written]
    end
  end

  def road_test_helper(registrant)
    if registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      registrant.license_data[:license]
    end

  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test')
      written_test_helper(registrant)
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      road_test_helper(registrant)
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License')
      if registrant.license_data[:written] && registrant.license_data[:license]
        registrant.license_data[:renewed] = true
      else 
        registrant.license_data[:renewed]
      end
    else 
      false
    end
  end
end
