class Facility
  attr_reader :address,
              :collected_fees,
              :name,
              :phone,
              :registered_vehicles, 
              :services

  def initialize(contact_info)
    @contact_info = contact_info
    @address = contact_info[:address]
    @collected_fees = 0
    @name = contact_info[:name]
    @phone = contact_info[:phone]
    @registered_vehicles = []
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless @services.include?("Vehicle Registration")
    
    if vehicle.antique? 
      vehicle.assign_plate(:antique) 
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      vehicle.assign_plate(:ev)
      @collected_fees += 200
    else
      vehicle.assign_plate(:regular)
      @collected_fees += 100
    end
    
    @registered_vehicles << vehicle
    vehicle.time_stamp
  end
 
  def administer_written_test(registrant)
    return false unless @services.include?("Written Test")
    return false unless registrant.permit?

    registrant.license_data[:written] = true
  end
 
  def administer_road_test(registrant)
    return false unless @services.include?("Road Test")
    return false unless registrant.license_data[:written] == true

    registrant.license_data[:license] = true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?("Renew License")
    return false unless registrant.license_data[:written] == true
    return false unless registrant.license_data[:license] == true

    registrant.license_data[:renewed] = true
  end
end
