require './spec/spec_helper'
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
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
        @registered_vehicles << vehicle
      elsif vehicle.electric_vehicle?
        vehicle.registration_date = Date.today
        vehicle.plate_type = :ev
        @collected_fees += 200
        @registered_vehicles << vehicle
      else
        vehicle.registration_date = Date.today
        vehicle.plate_type = :regular
        @collected_fees += 100
        @registered_vehicles << vehicle
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      return true
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
      return true
    end
    return false
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && 
      registrant.license_data[:written] && 
      registrant.license_data[:license]
        registrant.license_data[:renewed] = true
        return true
    end
    return false
  end
end

# facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

# cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
# bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
# camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

# binding.pry