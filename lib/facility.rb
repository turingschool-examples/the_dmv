require './lib/vehicle'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
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
      collected_fees += 25
      vehicle.plate_type = :ev
    elsif vehicle.ev
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    return false if !administer_written_test(registrant)
    registrant.license_data[:license] = true
    return true
  end
end
