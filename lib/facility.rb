require 'date'

class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees
              

  def initialize(info_hash, services = [])
    @name = info_hash[:name]
    @address = info_hash[:address]
    @phone = info_hash[:phone]
    @services = services
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless @services.include?('Vehicle Registration')
    if vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
      
    elsif
      vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    if registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true 
    else 
      false
    end
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test')
    if registrant.permit? == true 
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License')
    if registrant.license_data[:written] == true && registrant.license_data[:license] = true
      registrant.license_data[:renewed] = true
    else
      false  
    end
  end
end





