require 'date'
require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_accessor :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
  
    if vehicle.year < 1970
      vehicle.plate_type = :antique
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  
    @registered_vehicles << vehicle
  
    case vehicle.plate_type
    when :antique
      @collected_fees += 25
    when :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  
    @registered_vehicles
  end

  def administer_written_test(registrant)
    if registrant.age >= 16 && registrant.permit
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

  def renew_drivers_license(registrant)
    if registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end