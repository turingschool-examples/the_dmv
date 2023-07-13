require 'benchmark'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      registration_date = Date.today.inspect
      vehicle.register(registration_date)
      @registered_vehicles << vehicle
    else
      "This location cannot register vehicles"
    end
  end



end
