require 'pry'
require 'date'
require './lib/dmv'
require './lib/vehicle'
require './lib/facility'

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
end
