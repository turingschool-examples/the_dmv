require 'pry'
require 'date'
require './lib/dmv'
require './lib/vehicle'
require './lib/facility'
require './lib/registrant'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  attr_accessor :name, :address, :phone, :services

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  #refactor
  def register_vehicle(car)
    if services.find {|service| service.include?('Vehicle Registration')}
    current_time = DateTime.now
    cdt = current_time.strftime "%d/%m/%Y %H:%M"
    car.registration_date = cdt
    @registered_vehicles << car

      if Date.today.year - car.year > 25
        car.plate_type = :antique
      elsif Date.today.year - car.year <= 25 && car.engine == :ice
        car.plate_type = :regular
      else
        car.plate_type = :ev
      end

      if car.plate_type == :antique
        @collected_fees += 25
      elsif car.engine == :ev
        @collected_fees += 200
      else
        @collected_fees =+ 100
      end
    else
      nil
    end
  end

  def administer_written_test(name)
    if services.find {|service| service.include?('Written Test')}
      if name.permit == true && name.age >= 16
        name.license_data[:written] = true
        true
      else
        name.permit == false || name.age < 16
        false
      end
    else
      false
    end
  end

  def administer_road_test(name)
    if services.find {|service| service.include?('Road Test')}
      if name.license_data[:written] == true
        name.license_data[:license] = true
        true
      end
    else
      false
    end
  end

  def renew_drivers_license(name)
    if services.find {|service| service.include?('Renew License')}
      if name.license_data[:written] == true && name.license_data[:license] == true
        name.license_data[:renewed] = true
      elsif name.license_data[:written] == false || name.license_data[:license] == false
        name.license_data[:renewed] = false
      end
    else
      false
    end
  end
end
