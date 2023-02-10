class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    # write helper methods for this method 
    if services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today

      if vehicle.year <= 1998
          @collected_fees += 25
          vehicle.plate_type = :antique
        elsif vehicle.engine == :ev
            @collected_fees += 200
            vehicle.plate_type = :ev
        else 
          @collected_fees += 100
            vehicle.plate_type = :regular
      end
    end
  end

  def administer_written_test(registrant)
    if services.include?('Written Test') && registrant.permit == true && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.permit == true && registrant.age >= 16
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if services.include?('Renew License') && registrant.permit == true && registrant.age >= 16
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
