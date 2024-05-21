require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      vehicle.plate_type = :ev
      @collected_fees += 200
    else vehicle.plate_type = :regular
      @collected_fees += 100
    end
    @registered_vehicles << vehicle
  end 

  def eligible_for_written_test?(registrant)
    registrant.permit? && registrant.age >= 16
  end

  def administer_written_test(registrant)
    if eligible_for_written_test?(registrant) == true 
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_license(registrant)
    if registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
