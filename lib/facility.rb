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

  # could put a service_test method here to expedite all methods

  def registration_helper(vehicle)
    return if !@services.include?('Vehicle Registration')
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def register_ev(vehicle)
    return if !@services.include?('Vehicle Registration')
    vehicle.plate_type = :ev
    @collected_fees += 200
    registration_helper(vehicle)
  end

  def register_antique(vehicle)
    return if !@services.include?('Vehicle Registration')
    vehicle.plate_type = :antique
    @collected_fees += 25
    registration_helper(vehicle)
  end

  def register_reg(vehicle)
    return if !@services.include?('Vehicle Registration')
    vehicle.plate_type = :regular
    @collected_fees += 100
    registration_helper(vehicle)
  end

  def register_vehicle(vehicle)
    if vehicle.electric_vehicle?
      register_ev(vehicle)
    elsif vehicle.antique?
      register_antique(vehicle)
    else
      register_reg(vehicle)
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