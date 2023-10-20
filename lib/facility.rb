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
    current_time = DateTime.now
    cdt = current_time.strftime "%d/%m/%Y %H:%M"

binding.pry

  end
end
