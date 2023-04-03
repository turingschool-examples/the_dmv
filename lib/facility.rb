class Facility
  attr_reader     :name, 
                  :address, 
                  :phone, 
                  :services 
  attr_accessor   :registered_vehicles,
                  :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
 
  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
        if vehicle.antique?
          @collected_fees += 25
        elsif vehicle.electric_vehicle?
          @collected_fees += 200
      else
          @collected_fees += 100
      end
    @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && 
      registrant.permit? &&
      registrant.age >= 16
      
      registrant.license_data[:written] = true
        return true
      end
      false
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') &&
      registrant.license_data[:written]
      registrant.license_data[:license] = true
      return true
    end
    false
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') &&
      registrant.license_data[:license]
      registrant.license_data[:renewed] = true
      return true
    end
    false
  end

end

