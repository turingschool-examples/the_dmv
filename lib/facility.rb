class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
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
    return if !@services.include?('Vehicle Registration')
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    if vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
    elsif vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if registrant.age >= 16 && registrant.permit? && @services.include?('Written Test')
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true && @services.include?('Road Test')
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if registrant.license_data[:license] == true && @services.include?('Renew License')
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end