class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(name:, 
                 address:, 
                 phone:
                 )
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = (0)
  end

  def add_service(service)
    @services << service
    @services
  end

  def register_vehicle(car)
    if car.plate_type == nil
      age = 2023 - car.year
      registered_vehicles << car
      car.register
      if age >= 25
        @collected_fees += 25
      elsif (age < 25) && (car.engine != :ev)
        @collected_fees += 100
      else
        @collected_fees += 200
      end
    else
      nil
    end
  end

  def administer_written_test(tester)
    if (services.include? "Written Test") 
      if (tester.permit?) && (tester.age >= 16)
        tester.license_data[:written] = true
        true
      else
        false
      end
    else
      false
    end
  end

  def administer_road_test(tester)
    if (services.include? "Road Test") 
      if tester.license_data[:written] == true
        tester.license_data[:license] = true
        true
      else
        false
      end
    else
      false
    end
  end

  def renew_drivers_license(tester)
    if (services.include? "Renew License") 
      if (tester.license_data[:written] == true) && (tester.license_data[:license] == true)
        tester.license_data[:renewed] = true
        true
      else
        false
      end
    else
      false
    end
  end

end
