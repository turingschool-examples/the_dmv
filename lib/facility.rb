class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(facilities_info)
    @name = facilities_info[:name]
    @address = facilities_info[:address]
    @phone = facilities_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  
  end
  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    vehicle
  end
  

  def collected_fees
    @registered_vehicles.sum { |vehicle| calculated_fees(vehicle) }

  end


  def calculated_fees(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric?
      200
    else
      100
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end
  def administer_road_test(registrant)
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
        true
    
      else
        false
      end
    
    
  end

  def renew_drivers_license(registrant)
    # Check if the facility offers the service for license renewal
    return false unless @services.include?('Renew License')
  
    # Check if the registrant has passed both written and road tests
    return false unless registrant.license_data[:written] && registrant.license_data[:license]
  
    # Check if the registrant's license is not already renewed
    return false if registrant.license_data[:renewed]
  
    # Mark the license as renewed
    registrant.license_data[:renewed] = true
    true
  end
  

end
 

