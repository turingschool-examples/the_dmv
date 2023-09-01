require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(hash, collected_fees = 0)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @collected_fees = collected_fees
    @registered_vehicles = []
  end

  def add_service(service)
    unique_services = []
    unique_services << service
    @services = unique_services.uniq
  end

   def register_vehicle(vehicle)
      @registered_vehicles << vehicle
      self.vehicle.registration_date = Times.now
   end




end

require 'pry'; binding.pry
