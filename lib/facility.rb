class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :collected_fees,
              :registered_vehicles

  def initialize(facility_details)
    @name                = facility_details[:name]
    @address             = facility_details[:address]
    @phone               = facility_details[:phone]
    @services            = []
    @collected_fees      = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?("Vehicle Registration")
    return nil if !vehicle.is_a?(Vehicle)

    vehicle.register
    collect_fee(vehicle)
    @registered_vehicles << vehicle
  end

  def collect_fee(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    return false if !@services.include?("Written Test")
    return false if !registrant.is_a?(Registrant)
    
    if registrant.age >= 16 && registrant.permit? == true
      registrant.pass_written_test
      true
    else
      false
    end
  end
  
  def administer_road_test(registrant)
    return false if !@services.include?("Road Test")
    return false if !registrant.is_a?(Registrant)
    
    if registrant.license_data[:written] == true
      registrant.earn_license
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    return false if !@services.include?("Renew License")
    return false if !registrant.is_a?(Registrant)

    if registrant.license_data[:license] == true
      registrant.renew_license
      true
    else
      false
    end
  end
end
